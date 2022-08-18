package external_server

import "crudItem/modules/cliente/domain/repository"

type ClienteHandle struct {
	repo repository.IClienteRepository
}

// constructor
func NewClientHandler(repo repository.IClienteRepository) *ClienteHandle {
	return &ClienteHandle{
		repo,
	}
}
