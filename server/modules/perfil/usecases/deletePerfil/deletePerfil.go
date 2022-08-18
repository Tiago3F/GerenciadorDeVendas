package usecases

import "crudItem/modules/perfil/domain/repository"

type DeletePerfilUseCase struct {
	repository repository.IPerfilRepository
}

func NewDeletePerfilUseCase(repo repository.IPerfilRepository) *DeletePerfilUseCase {
	return &DeletePerfilUseCase{
		repository: repo,
	}
}

func (de *DeletePerfilUseCase) DeletePerfil(id string) (bool, error) {
	result, err := de.repository.DeletePerfil(id)
	if err != nil {
		return false, err
	}

	return result, nil
}
