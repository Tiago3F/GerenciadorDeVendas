package repository

import (
	"crudItem/modules/base/domain/entity"
	"fmt"
)

type ItemRepositoryFake struct {
}

func NewItemRepositoryFake() *ItemRepositoryFake {
	return &ItemRepositoryFake{}
}

//db fake
var ItemsDb []entity.Item

// Declaração da implementação do repository
var _ IItemRepository = &ItemRepositoryFake{}

// PostItems implements IItemRepository
func (*ItemRepositoryFake) PostItems(item entity.Item) (*entity.Item, error) {
	ItemsDb = append(ItemsDb, item)

	return &item, nil
}

// GetItems implements IItemRepository
func (*ItemRepositoryFake) GetItems() (*[]entity.Item, error) {
	panic("unimplemented")
}

// DelteItem implements IItemRepository
func (*ItemRepositoryFake) DelteItem(id string) (bool, error) {

	newItems := make([]entity.Item, 0)
	isDeleted := false

	for _, item := range ItemsDb {
		if fmt.Sprint(item.ID) != id {
			newItems = append(newItems, item)
		} else {
			isDeleted = true
		}
	}

	ItemsDb = newItems

	return isDeleted, nil
}
