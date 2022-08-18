package repository

import (
	"crudItem/modules/base/domain/entity"
)

type IItemRepository interface {
	GetItems() (*[]entity.Item, error)
	PostItems(item entity.Item) (*entity.Item, error)
	DelteItem(id string) (bool, error)
}
