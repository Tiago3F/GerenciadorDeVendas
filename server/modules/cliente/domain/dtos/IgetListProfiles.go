package dtos

import "crudItem/modules/cliente/domain/entity"

type IGetListProfilesReturnDTO struct {
	TotalRows int16            `json:"totalRows"`
	Rows      []entity.Cliente `json:"rows"`
} // total de linhas e linhas

type IGetCLientParams struct {
	Nome   string `json:"nome"`
	Limite string `json:"limite"`
	Offset string `json:"offset"`
}
