package infrastructure

import (
	"context"
	"crudItem/modules/base/domain/entity"
	"crudItem/modules/base/domain/repository"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
)

type ItemPgxRepository struct {
	db *pgx.Conn
}

var _ repository.IItemRepository = &ItemPgxRepository{}

// construtor
func NewItemPgxRepository(db *pgx.Conn) *ItemPgxRepository {
	return &ItemPgxRepository{db}
}

// GetItems implements repository.IItemRepository
func (it *ItemPgxRepository) GetItems() (*[]entity.Item, error) {

	var items []entity.Item

	// defer it.db.Close(context.Background())

	err := it.db.QueryRow(context.Background(),
		` SELECT 
			i.id,
			i.descricao,
			i.sn,
			i.mac,
			i.imei,
			i.criado_em AS criacao_item
			-- l.nome,
			-- l.criado_em
		FROM item i
	    -- INNER JOIN localidade l ON i.localidade_id = l.id`,
	).Scan(&items)
	if err != nil {
		fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
		// os.Exit(1)
		return nil, err
	}

	return &items, nil
}

// DelteItem implements repository.IItemRepository
func (*ItemPgxRepository) DelteItem(id string) (bool, error) {
	panic("unimplemented")
}

// PostItems implements repository.IItemRepository
func (*ItemPgxRepository) PostItems(item entity.Item) (*entity.Item, error) {
	panic("unimplemented")
}
