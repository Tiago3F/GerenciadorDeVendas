package repository

import "crudItem/modules/produto/domain/entity"

type IProdutoRepository interface {
	PostProduto(produto entity.Produto) (*entity.Produto, error)

	UpdateProduto(entity.Produto) (*entity.Produto, error)
}
