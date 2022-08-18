package dtos

import "crudItem/modules/perfil/domain/entity"

type IGetListProfilesReturnDTO struct {
	TotalRows int16           `json:"totalRows"`
	Rows      []entity.Perfil `json:"rows"`
}

type IGetPerfilParams struct {
	Name     string `json:"name"`
	PageSize string `json:"pageSize"`
	Offset   string `json:"offset"`
}
