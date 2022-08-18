package usecases

import (
	"crudItem/modules/base/domain/entity"
	"crudItem/modules/base/domain/repository"
	test_item "crudItem/modules/base/e2e"
	postItem "crudItem/modules/base/usecases/postItem"
	"fmt"

	"testing"

	"github.com/google/uuid"
	"github.com/stretchr/testify/assert"
)

// func TestDeleteItemPositive(t *testing.T) {

// 	mac, err := test_item.GenerateMac()
// 	if err != nil {
// 		t.Error("erro ao gerar mac: ", err)
// 	}

// 	repo := repository.NewItemRepositoryFake()

// 	// Criar item
// 	ItemMock := entity.Item{
// 		Descricao: "item descricao",
// 		Sn:        "32132131231",
// 		Mac:       mac,
// 		Imei:      "eqe23e32e32e32",
// 	}

// 	postitemUseCase := postItem.NewPostItemUseCase(repo)
// 	item, err := postitemUseCase.PostItems(ItemMock)
// 	if err != nil {
// 		t.Error("Failed to create item: ", err)
// 	}

// 	deleteItemUseCase := NewDeleteItemUseCase(repo)

// 	result, err := deleteItemUseCase.DeleteItems(fmt.Sprint(item.ID))
// 	if err != nil {
// 		t.Error("Failed to delete item: ", err)
// 	}

// 	assert.Equal(t, result, true)
// }

// func TestDeleteItemNegative(t *testing.T) {

// 	repo := repository.NewItemRepositoryFake()

// 	id := uuid.New().String()
// 	deleteItemUseCase := NewDeleteItemUseCase(repo)

// 	result, err := deleteItemUseCase.DeleteItems(id)
// 	if err != nil {
// 		t.Error("Failed to delete item: ", err)
// 	}

// 	assert.Equal(t, result, false)
// }

func TestUnidadeItem(t *testing.T) {

	t.Run("Deve ser capaz de deletar um item", func(t *testing.T) {
		mac, err := test_item.GenerateMac()
		if err != nil {
			t.Error("erro ao gerar mac: ", err)
		}

		repo := repository.NewItemRepositoryFake()

		// Criar item
		ItemMock := entity.Item{
			Descricao: "item descricao",
			Sn:        "32132131231",
			Mac:       mac,
			Imei:      "eqe23e32e32e32",
		}

		postitemUseCase := postItem.NewPostItemUseCase(repo)
		item, err := postitemUseCase.PostItems(ItemMock)
		if err != nil {
			t.Error("Failed to create item: ", err)
		}

		deleteItemUseCase := NewDeleteItemUseCase(repo)

		result, err := deleteItemUseCase.DeleteItems(fmt.Sprint(item.ID))
		if err != nil {
			t.Error("Failed to delete item: ", err)
		}

		assert.Equal(t, result, true)
	})

	t.Run("Deve ser de retornar error caso o item não exista", func(t *testing.T) {
		repo := repository.NewItemRepositoryFake()

		id := uuid.New().String()
		deleteItemUseCase := NewDeleteItemUseCase(repo)

		result, err := deleteItemUseCase.DeleteItems(id)
		if err != nil {
			t.Error("Failed to delete item: ", err)
		}

		assert.Equal(t, false, result)
	})
}
