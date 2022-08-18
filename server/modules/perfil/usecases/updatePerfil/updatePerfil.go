package usecases

import (
	"crudItem/modules/perfil/domain/entity"
	"crudItem/modules/perfil/domain/repository"
)

type UpdatePerfilUsacase struct {
	repository repository.IPerfilRepository
}

func NewUpdatePerfilUsacase(repo repository.IPerfilRepository) *UpdatePerfilUsacase {
	return &UpdatePerfilUsacase{
		repository: repo,
	}
}

func (it *UpdatePerfilUsacase) UpdatePerfil(perfil entity.Perfil) (*entity.Perfil, error) {

	return it.repository.UpdatePerfil(perfil)

}
