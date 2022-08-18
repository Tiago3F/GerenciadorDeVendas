package usecases

import (
	"crudItem/modules/produto/domain/entity"
	"crudItem/modules/produto/domain/repository"
)

type PutProdutoUseCase struct {
	repository repository.IProdutoRepository
}

func NewPutProdutoUseCase(repo repository.IProdutoRepository) *PutProdutoUseCase {
	return &PutProdutoUseCase{
		repository: repo,
	}
}

func (pr *PutProdutoUseCase) UpdateProduto(produto entity.Produto) (*entity.Produto, error) {

	return pr.repository.UpdateProduto(produto)
}
