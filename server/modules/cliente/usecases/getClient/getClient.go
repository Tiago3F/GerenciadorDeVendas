package usecases

import (
	"crudItem/modules/cliente/domain/dtos"
	"crudItem/modules/cliente/domain/repository"
)

type GetClientlUseCase struct {
	repository repository.IClienteRepository
}

func NewGetClientUseCase(repo repository.IClienteRepository) *GetClientlUseCase {
	return &GetClientlUseCase{
		repository: repo,
	}
}

func (cli *GetClientlUseCase) GetClientName(params dtos.IGetCLientParams) (*dtos.IGetListProfilesReturnDTO, error) {
	return cli.repository.GetClientName(params)
}
