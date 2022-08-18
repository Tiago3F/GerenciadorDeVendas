package repository

import (
	"crudItem/modules/perfil/domain/dtos"
	"crudItem/modules/perfil/domain/entity"
)

type IPerfilRepository interface {
	DeletePerfil(id string) (bool, error)
	PostPerfil(perfil entity.Perfil) (*entity.Perfil, error)
	UpdatePerfil(entity.Perfil) (*entity.Perfil, error)

	GetPerfilByName(params dtos.IGetPerfilParams) (*dtos.IGetListProfilesReturnDTO, error)
}
