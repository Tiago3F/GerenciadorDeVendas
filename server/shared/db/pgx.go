package db

import (
	"context"
	item_implements_repository "crudItem/modules/base/infrastructure"
	cliente_implements_repositort "crudItem/modules/cliente/infrastructure"
	perfil_implements_repository "crudItem/modules/perfil/infrastructure"
	produto_implements_repository "crudItem/modules/produto/infrastructure"

	"crudItem/shared/config"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
	"go.uber.org/zap"
)

func NewPgxRepository(params config.AuthPostgres, log *zap.Logger) (*IRepositories, error) {

	DBURL := fmt.Sprintf("postgres://%s:%s@%s:%s/%s",
		params.DB_USER,
		params.DB_PASSWORD,
		params.DB_HOST,
		params.DB_PORT,
		params.DB_NAME,
	)

	// urlExample := "postgres://username:password@localhost:5432/database_name"
	// conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
	conn, err := pgx.Connect(context.Background(), DBURL)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	}

	return &IRepositories{
		Item:    item_implements_repository.NewItemPgxRepository(conn),
		Perfil:  perfil_implements_repository.NewPerfilRepository(conn),
		Cliente: cliente_implements_repositort.NewClientRepository(conn),
		Produto: produto_implements_repository.NewProdutoRepository(conn),
	}, nil
}
