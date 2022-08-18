package external_server

import (
	entity "crudItem/modules/base/domain/entity"
	"crudItem/modules/base/dtos"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// // negative
// func (suite *Suite) TestGetItemsNegative() {

// 	// instancia factory de items
// 	factory := Item_test_factory{}

// 	// clear db
// 	_, err := factory.ClearDb()
// 	if err != nil {
// 		suite.T().Error("Failed to clear db: ", err)
// 	}

// 	// Create a New Request
// 	req, _ := http.NewRequest("GET", "/items", nil)

// 	// Execute Request
// 	response := suite.executeRequest(req, suite.server)

// 	assert.Equal(suite.T(), 200, response.Code)
// 	assert.Equal(suite.T(), `{"msg": "Nenhum item encontrado!"}`, response.Body.String())
// }

// // positive
// func (suite *Suite) TestGetItemsPositive() {

// 	// Create a New Request
// 	req, _ := http.NewRequest("GET", "/items", nil)

// 	item := []dtos.ItemDTO{}

// 	// instancia factory de items
// 	factory := Item_test_factory{}

// 	// Criar item no db
// 	itemDb, errItem := factory.CreateItem(
// 		entity.Item{
// 			Descricao: "item test",
// 			Sn:        "323232323232",
// 			Imei:      "dwq2323242",
// 			Mac:       "ddddd",
// 		},
// 	)
// 	if errItem != nil {
// 		suite.T().Error("Failed to create item: ", errItem)
// 	}

// 	// Execute Request
// 	response := suite.executeRequest(req, suite.server)

// 	errMarshal := json.Unmarshal(response.Body.Bytes(), &item)
// 	if errMarshal != nil {
// 		suite.T().Error("Failed to unmarshal response: ", errMarshal)
// 	}

// 	// deleta item criado para teste do db
// 	defer factory.DeleteItem(fmt.Sprint(itemDb.ID))

// 	assert.Equal(suite.T(), response.Code, 200)
// 	require.Greater(suite.T(), len(item), 0)
// 	assert.NotZero(suite.T(), item[0].ID, "Campo de ID")
// 	assert.NotZero(suite.T(), item[0].Descricao, "Campo de descricao")
// 	assert.NotZero(suite.T(), item[0].Imei, "Campo de Imei")
// 	assert.NotZero(suite.T(), item[0].Sn, "Campo de Sn")
// }

// // delete item
// func (suite *Suite) TestDeleteItemsNegative() {

// 	id := uuid.New().String()

// 	// Create a New Request
// 	req, _ := http.NewRequest("DELETE", fmt.Sprintf("/items/%v", id), nil)

// 	// Execute Request
// 	response := suite.executeRequest(req, suite.server)

// 	assert.Equal(suite.T(), 404, response.Code)
// 	assert.Equal(suite.T(), `{"msg": "Nenhum item encontrado!"}`, response.Body.String())
// }

// func (suite *Suite) TestDeleteItemsPositive() {

// 	// instancia factory de items
// 	factory := NewItemTestFfactory()

// 	// Criar item no db
// 	itemDb, errItem := factory.CreateItem(
// 		entity.Item{
// 			Descricao: "item test",
// 			Sn:        "323232323232",
// 			Imei:      "dwq2323242",
// 			Mac:       "ddddd",
// 		},
// 	)
// 	if errItem != nil {
// 		suite.T().Error("Failed to create item: ", errItem)
// 	}

// 	fmt.Sprint(itemDb)

// 	factory.DeleteItem(fmt.Sprint(itemDb.ID))

// 	// Create a New Request
// 	req, _ := http.NewRequest("DELETE", fmt.Sprintf("/items/%v", itemDb.ID), nil)

// 	// Execute Request
// 	response := suite.executeRequest(req, suite.server)

// 	log.Println("response: ", response.Body.String())

// 	assert.Equal(suite.T(), 200, response.Code)
// 	assert.Equal(suite.T(), `{"msg": "item deletaddo com sucesso!"}`, response.Body.String())
// }

func (s *Suite) TestItems() {

	s.Run("E2e: Deve retornar uma mensagem de erro quando não houver items cadastrados", func() {
		// // instancia factory de items
		factory := Item_test_factory{}

		_, err := factory.ClearDb()
		if err != nil {
			s.T().Error("Failed to clear db: ", err)
		}

		// Create a New Request
		req, _ := http.NewRequest("GET", "/items", nil)

		// Execute Request
		response := s.executeRequest(req, s.server)

		assert.Equal(s.T(), 200, response.Code)
		assert.Equal(s.T(), `{"msg": "Nenhum item encontrado!"}`, response.Body.String())
	})

	s.Run("E2e: Deve ser capaz de listar todos os items", func() {
		// Create a New Request
		req, _ := http.NewRequest("GET", "/items", nil)

		item := []dtos.ItemDTO{}

		// instancia factory de items
		factory := Item_test_factory{}

		// Criar item no db
		itemDb, errItem := factory.CreateItem(
			entity.Item{
				Descricao: "item test",
				Sn:        "323232323232",
				Imei:      "dwq2323242",
				Mac:       "ddddd",
			},
		)
		if errItem != nil {
			s.T().Error("Failed to create item: ", errItem)
		}

		// Execute Request
		response := s.executeRequest(req, s.server)

		errMarshal := json.Unmarshal(response.Body.Bytes(), &item)
		if errMarshal != nil {
			s.T().Error("Failed to unmarshal response: ", errMarshal)
		}

		// deleta item criado para teste do db
		factory.DeleteItem(fmt.Sprint(itemDb.ID))

		assert.Equal(s.T(), response.Code, 200)
		require.Greater(s.T(), len(item), 0)
		assert.NotZero(s.T(), item[0].ID, "Campo de ID")
		assert.NotZero(s.T(), item[0].Descricao, "Campo de descricao")
		assert.NotZero(s.T(), item[0].Imei, "Campo de Imei")
		assert.NotZero(s.T(), item[0].Sn, "Campo de Sn")
	})

	s.Run("E2e: Deve ser capaz de deletar um item", func() {
		// instancia factory de items
		factory := NewItemTestFfactory()

		// Criar item no db
		itemDb, errItem := factory.CreateItem(
			entity.Item{
				Descricao: "item test",
				Sn:        "323232323232",
				Imei:      "dwq2323242",
				Mac:       "ddddd",
			},
		)
		if errItem != nil {
			s.T().Error("Failed to create item: ", errItem)
		}

		// Create a New Request
		req, _ := http.NewRequest("DELETE", fmt.Sprintf("/items/%v", itemDb.ID), nil)

		// Execute Request
		response := s.executeRequest(req, s.server)

		assert.Equal(s.T(), 200, response.Code)
		assert.Equal(s.T(), `{"msg": "item deletaddo com sucesso!"}`, response.Body.String())
	})
}
