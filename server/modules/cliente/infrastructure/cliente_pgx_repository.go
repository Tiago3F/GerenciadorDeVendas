package infrastructure

import (
	"context"
	"crudItem/modules/cliente/domain/dtos"
	"crudItem/modules/cliente/domain/entity"
	"crudItem/modules/cliente/domain/repository"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
)

type ClienteRepository struct {
	db *pgx.Conn
}

var _ repository.IClienteRepository = &ClienteRepository{}

func NewClientRepository(db *pgx.Conn) *ClienteRepository {
	return &ClienteRepository{db}
}
func (cli *ClienteRepository) PostClient(client entity.Cliente) (*entity.Cliente, error) {
	var clients entity.Cliente

	err := cli.db.QueryRow(context.Background(), `INSERT INTO cliente (cpf, nome, limite, cc) VALUES ($1, $2, $3, $4) RETURNING *`, client.Cpf, client.Nome, client.Limite, client.Cc).
		Scan(
			&clients.ID,
			&clients.Cpf,
			&clients.Nome,
			&clients.Limite,
			&clients.Cc,
		)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Error inserting: %v\n", err)
		return nil, err
	}

	return &clients, nil
}
func (c *ClienteRepository) UpdateCliente(client entity.Cliente) (*entity.Cliente, error) {
	var cli entity.Cliente
	err := c.db.QueryRow(context.Background(),
		`
			UPDATE cliente SET nome = $1, limite = $2, cc = $3 WHERE id = $4 RETURNING *;
		`,
		client.Nome, &client.Limite, &client.Cc, client.ID,
	).Scan(&cli.ID, &cli.Cpf, &cli.Nome, &cli.Limite, &cli.Cc)
	if err != nil {
		fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
		// os.Exit(1)
		return nil, err
	}

	return &cli, nil
}
func (c *ClienteRepository) GetClientName(params dtos.IGetCLientParams) (*dtos.IGetListProfilesReturnDTO, error) {
	rows, err := c.db.Query(context.Background(),
		`
		SELECT 
			*,
			COUNT(*) OVER() AS count
		FROM cliente WHERE 
		CASE 
			WHEN '$1' = '' THEN true
			ELSE nome ILIKE '%' || $1 || '%' 
		END
		ORDER BY id
		LIMIT $3 OFFSET $2
	`, params.Nome, params.Offset, params.Limite)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Error filtering By Name: %v ", err)
		return nil, err
	}

	var clientes []entity.Cliente

	var count int16

	defer rows.Close()

	for rows.Next() {
		var cliente entity.Cliente

		if err = rows.Scan(&cliente.ID, &cliente.Cpf, &cliente.Nome,
			&cliente.Limite, &cliente.Cc, &count); err != nil {
			return nil, err
		}

		clientes = append(clientes, cliente)
	}

	result := dtos.IGetListProfilesReturnDTO{
		Rows:      clientes,
		TotalRows: count,
	}

	return &result, nil
}
func (c *ClienteRepository) DeleteClient(id int) (message string) {
	const query = "DELETE FROM cliente WHERE id = $1"
	commandTag, err := c.db.Exec(context.Background(), query, id)

	if err != nil {
		fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
		os.Exit(1)
	}

	if commandTag.RowsAffected() != 1 {
		fmt.Println("No row found to delete")
		os.Exit(1)
	}

	message = fmt.Sprintf("Album with the id of %v has been deleted\n", id)
	return message
}
