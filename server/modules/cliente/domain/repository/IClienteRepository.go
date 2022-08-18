package repository

import (
	"crudItem/modules/cliente/domain/dtos"
	"crudItem/modules/cliente/domain/entity"
)

type IClienteRepository interface {
	PostClient(client entity.Cliente) (*entity.Cliente, error)
	UpdateCliente(entity.Cliente) (*entity.Cliente, error)
	GetClientName(params dtos.IGetCLientParams) (*dtos.IGetListProfilesReturnDTO, error)
	DeleteClient(id int) (message string)
}
