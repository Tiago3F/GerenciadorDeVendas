package usecases

import "crudItem/modules/cliente/domain/repository"

type DeleteClientlUseCase struct {
	repository repository.IClienteRepository
}

func NewDeleteClientUseCase(repo repository.IClienteRepository) *DeleteClientlUseCase {
	return &DeleteClientlUseCase{
		repository: repo,
	}
}

func (cli *DeleteClientlUseCase) DeleteClient(id int) (message string) {
	return cli.repository.DeleteClient(id)
}
