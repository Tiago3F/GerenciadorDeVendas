package usecases

import (
	"crudItem/modules/cliente/domain/entity"
	"crudItem/modules/cliente/domain/repository"
)

type UpdateClientlUseCase struct {
	repository repository.IClienteRepository
}

func NewUpdateClientUseCase(repo repository.IClienteRepository) *UpdateClientlUseCase {
	return &UpdateClientlUseCase{
		repository: repo,
	}
}

func (cl *UpdateClientlUseCase) UpdateCliente(client entity.Cliente) (*entity.Cliente, error) {

	return cl.repository.UpdateCliente(client)
}
