package infrastructure

import (
	"context"
	"crudItem/modules/perfil/domain/dtos"
	"crudItem/modules/perfil/domain/entity"
	"crudItem/modules/perfil/domain/repository"

	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
)

type PerfilRepository struct {
	db *pgx.Conn
}

var _ repository.IPerfilRepository = &PerfilRepository{}

func NewPerfilRepository(db *pgx.Conn) *PerfilRepository {
	return &PerfilRepository{db}
}

func (pe *PerfilRepository) DeletePerfil(id string) (bool, error) {
	var perfil entity.Perfil

	err := pe.db.QueryRow(context.Background(), `DELETE FROM perfil WHERE id = $1`, id).Scan(&perfil.ID)
	if err != nil {
		return false, nil
	}
	return true, err
}

func (per *PerfilRepository) PostPerfil(perfil entity.Perfil) (*entity.Perfil, error) {
	var perf entity.Perfil

	err := per.db.QueryRow(context.Background(), `INSERT INTO perfil (nome) VALUES ($1) RETURNING *`, perfil.Nome).Scan(&perf.ID, &perf.Nome)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Error inserting: %v\n", err)
		return nil, err
	}

	return &perf, nil
}

// UpdatePerfil implements repository.IPerfilRepository
func (p *PerfilRepository) UpdatePerfil(per entity.Perfil) (*entity.Perfil, error) {
	var perfil entity.Perfil
	err := p.db.QueryRow(context.Background(),
		`
			UPDATE perfil SET nome = $1 WHERE id = $2 RETURNING *;
		`,
		per.Nome, per.ID,
	).Scan(&perfil.ID, &perfil.Nome)
	if err != nil {
		fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
		// os.Exit(1)
		return nil, err
	}

	return &perfil, nil
}

// GetPerfilByName implements repository.IPerfilRepository
func (p *PerfilRepository) GetPerfilByName(params dtos.IGetPerfilParams) (*dtos.IGetListProfilesReturnDTO, error) {

	rows, err := p.db.Query(context.Background(),
		`
		SELECT 
			*,
			COUNT(*) OVER() AS count
		FROM perfil WHERE 
		CASE 
			WHEN '$1' = '' THEN true
			ELSE nome ILIKE '%' || $1 || '%' 
		END
		LIMIT $3 OFFSET $2
	`, params.Name, params.Offset, params.PageSize)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Error filtering By Name: %v ", err)
		return nil, err
	}

	var perfis []entity.Perfil

	var count int16

	// Fecha linhas para libear db para proxima conexão
	defer rows.Close()

	for rows.Next() {
		var perfil entity.Perfil

		if err = rows.Scan(&perfil.ID, &perfil.Nome, &count); err != nil {
			return nil, err
		}

		perfis = append(perfis, perfil)
	}

	result := dtos.IGetListProfilesReturnDTO{
		Rows:      perfis,
		TotalRows: count,
	}

	return &result, nil

}
