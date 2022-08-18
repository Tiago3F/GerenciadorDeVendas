package infrastructure

import (
	"context"
	"crudItem/modules/produto/domain/entity"
	"crudItem/modules/produto/domain/repository"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
)

type ProdutoRepository struct {
	db *pgx.Conn
}

var _ repository.IProdutoRepository = &ProdutoRepository{}

func NewProdutoRepository(db *pgx.Conn) *ProdutoRepository {
	return &ProdutoRepository{db}
}

// ROTA PARA CRIAÇÃO DE PRODUTOS
func (pr *ProdutoRepository) PostProduto(produto entity.Produto) (*entity.Produto, error) {
	var produt entity.Produto

	err := pr.db.QueryRow(context.Background(),
		`

		INSERT INTO produto (
			nome, 
			preco, 
			unidade
			) VALUES (
				$1, 
				$2, 
				$3
					) RETURNING *
					
	`, produto.Nome, produto.Preco, produto.Unidade,
	).Scan(&produt.ID, &produt.Nome, &produt.Preco, &produt.Unidade)

	if err != nil {
		fmt.Fprintf(os.Stderr, "Error inserting: %v ", err)
		return nil, err
	}

	return &produt, nil
}

// ROTA PARA ATUALIZACAO DE PRODUTOS
func (pr *ProdutoRepository) UpdateProduto(produto entity.Produto) (*entity.Produto, error) {
	var prod entity.Produto

	err := pr.db.QueryRow(context.Background(),
		`
			UPDATE produto SET 
				nome = $1, 
				preco = $2, 
				unidade = $3 WHERE 	id = $4 RETURNING *;
		`,
		produto.Nome, produto.Preco, produto.Unidade, produto.ID,
	).Scan(&prod.ID, &prod.Nome, &prod.Preco, &prod.Unidade)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error Scaning: %v\n", err)
		// os.Exit(1)
		return nil, err
	}

	return &prod, nil
}
