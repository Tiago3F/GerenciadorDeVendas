package usecases

import (
	"crudItem/modules/produto/domain/entity"
	"crudItem/modules/produto/domain/repository"
)

type PostProdutoUseCase struct {
	repository repository.IProdutoRepository
}

func NewPostProdutoUseCase(repo repository.IProdutoRepository) *PostProdutoUseCase {
	return &PostProdutoUseCase{
		repository: repo,
	}
}

func (pr *PostProdutoUseCase) PostProduto(produto entity.Produto) (*entity.Produto, error) {

	return pr.repository.PostProduto(produto)
}
