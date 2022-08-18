package usecases

import (
	"crudItem/modules/perfil/domain/entity"
	"crudItem/modules/perfil/domain/repository"
)

type PostPerfilUseCase struct {
	repository repository.IPerfilRepository
}

func NewPostPerfilUseCase(repo repository.IPerfilRepository) *PostPerfilUseCase {
	return &PostPerfilUseCase{repository: repo}
}

func (per *PostPerfilUseCase) PostPerfil(perfil entity.Perfil) (*entity.Perfil, error) {

	return per.repository.PostPerfil(perfil)
}
