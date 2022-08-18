package external_server

import (
	"crudItem/modules/produto/domain/repository"
)

type ProdutoHandle struct {
	repo repository.IProdutoRepository
}

// constructor
func NewProdutoHandler(repo repository.IProdutoRepository) *ProdutoHandle {
	return &ProdutoHandle{
		repo,
	}
}
