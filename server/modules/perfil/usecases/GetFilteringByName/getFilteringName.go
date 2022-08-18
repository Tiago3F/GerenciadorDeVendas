package usecases

import (
	"crudItem/modules/perfil/domain/dtos"
	"crudItem/modules/perfil/domain/repository"
)

type GetFilterByName struct {
	repository repository.IPerfilRepository
}

func NewGetFilterByName(repository repository.IPerfilRepository) *GetFilterByName {
	return &GetFilterByName{
		repository: repository,
	}
}

func (p *GetFilterByName) GetFilter(params dtos.IGetPerfilParams) (*dtos.IGetListProfilesReturnDTO, error) {

	return p.repository.GetPerfilByName(params)

}
