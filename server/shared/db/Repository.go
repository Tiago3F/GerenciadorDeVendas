package db

import (
	Iitem_repository "crudItem/modules/base/domain/repository"
	Cliente_repository "crudItem/modules/cliente/domain/repository"
	Perfil_repository "crudItem/modules/perfil/domain/repository"
	Produto_repository "crudItem/modules/produto/domain/repository"
	"crudItem/shared/config"

	"go.uber.org/zap"
)

type IRepositories struct {
	Item    Iitem_repository.IItemRepository
	Perfil  Perfil_repository.IPerfilRepository
	Cliente Cliente_repository.IClienteRepository
	rest    any
	Produto Produto_repository.IProdutoRepository
}

func NewRepository(params config.ConfigParamsDb, log *zap.Logger) (*IRepositories, error) {
	// return NewGormRepository(params.AuthGormPostgresParams, log)

	return NewPgxRepository(params.AuthGormPostgresParams, log)
}
