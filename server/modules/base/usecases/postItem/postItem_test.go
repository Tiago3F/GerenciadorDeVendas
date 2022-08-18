package usecases

import (
	"crudItem/modules/base/domain/entity"
	"crudItem/modules/base/domain/repository"
	test_item "crudItem/modules/base/e2e"

	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPostItem(t *testing.T) {

	t.Run("Deve ser capaz de cadastrar um item", func(t *testing.T) {

		mac, err := test_item.GenerateMac()
		if err != nil {
			t.Error("erro ao gerar mac: ", err)
		}

		repo := repository.NewItemRepositoryFake()
		postMock := entity.Item{
			Descricao: "item descricao",
			Sn:        "32132131231",
			Mac:       mac,
			Imei:      "eqe23e32e32e32",
		}
		postItemUseCase := NewPostItemUseCase(repo)

		item, err := postItemUseCase.PostItems(postMock)
		if err != nil {
			t.Error("Failed to create item: ", err)
		}

		itemsValue := *item

		assert.NotZero(t, itemsValue.ID)
		assert.Equal(t, itemsValue.Descricao, postMock.Descricao)
		assert.Equal(t, itemsValue.Sn, postMock.Sn)

		assert.Equal(t, itemsValue.Mac, postMock.Mac)
		assert.Equal(t, itemsValue.Imei, postMock.Imei)

	})

}
