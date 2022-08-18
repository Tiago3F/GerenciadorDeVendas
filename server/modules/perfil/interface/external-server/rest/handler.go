package external_server

import (
	"crudItem/modules/perfil/domain/repository"
)

type PerfilHandle struct {
	repo repository.IPerfilRepository
}

// constructor
func NewPerfilHandler(repo repository.IPerfilRepository) *PerfilHandle {
	return &PerfilHandle{
		repo,
	}
}
