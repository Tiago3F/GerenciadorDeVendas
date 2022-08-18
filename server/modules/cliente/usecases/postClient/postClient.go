package usecases

import (
	"crudItem/modules/cliente/domain/entity"
	"crudItem/modules/cliente/domain/repository"
)

type PostClientlUseCase struct {
	repository repository.IClienteRepository
}

func NewPostClientUseCase(repo repository.IClienteRepository) *PostClientlUseCase {
	return &PostClientlUseCase{
		repository: repo,
	}
}

func (cl *PostClientlUseCase) PostClient(client entity.Cliente) (*entity.Cliente, error) {

	return cl.repository.PostClient(client)
}
