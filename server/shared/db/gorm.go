package db

import (
	item_implements_repository "crudItem/modules/base/infrastructure"

	"crudItem/shared/config"

	"fmt"

	"go.uber.org/zap"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// Implementação do gorm
func NewGormRepository(params config.AuthPostgres, log *zap.Logger) (*IRepositories, error) {

	DBURL := fmt.Sprintf("host=%s port=%s user=%s dbname=%s sslmode=disable password=%s",
		params.DB_HOST,
		params.DB_PORT,
		params.DB_USER,
		params.DB_NAME,
		params.DB_PASSWORD,
	)

	sugar := log.Sugar()

	db, err := gorm.Open(postgres.Open(DBURL))
	if err != nil {
		sugar.Errorf("Erro ao conectar db: %v", err.Error())
		return nil, err
	}

	return &IRepositories{
		Item: item_implements_repository.NewItemGormRepository(db),
	}, nil
}
