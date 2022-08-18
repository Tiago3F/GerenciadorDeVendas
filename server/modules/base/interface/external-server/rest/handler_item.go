package external_server

import (
	"crudItem/modules/base/domain/entity"
	"crudItem/modules/base/domain/repository"
	"crudItem/modules/base/usecases"
	deleteItemUsecases "crudItem/modules/base/usecases/deleteItem"
	postItemUsecases "crudItem/modules/base/usecases/postItem"

	"encoding/json"
	"net/http"

	"github.com/go-chi/chi/v5"
)

type Items struct {
	it repository.IItemRepository
}

// constructor
func NewItemHandler(it repository.IItemRepository) *Items {
	return &Items{
		it: it,
	}
}

func (item *Items) GetItems(w http.ResponseWriter, r *http.Request) {

	getItemUseCase := usecases.NewGetItemUseCase(item.it)

	items, err := getItemUseCase.GetItems()
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	if len(*items) <= 0 {
		w.WriteHeader(200)
		w.Write([]byte(`{"Mensagem": "Nenhum cliente encontrado!"}`))
		return
	}

	w.WriteHeader(http.StatusOK)

	json.NewEncoder(w).Encode(items)
}

// Criar items
func (item *Items) PostItems(w http.ResponseWriter, r *http.Request) {

	var itembody entity.Item

	err := json.NewDecoder(r.Body).Decode(&itembody)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	postItemUseCase := postItemUsecases.NewPostItemUseCase(item.it)

	Items, err := postItemUseCase.PostItems(itembody)

	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	w.WriteHeader(http.StatusCreated)

	json.NewEncoder(w).Encode(Items)
}

func (item *Items) DeleteItems(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")

	deleteItemUseCase := deleteItemUsecases.NewDeleteItemUseCase(item.it)

	result, err := deleteItemUseCase.DeleteItems(id)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	if result {
		w.WriteHeader(200)
		w.Write([]byte(`{"msg": "item deletaddo com sucesso!"}`))
		return

	} else {

		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte(`{"msg": "Nenhum item encontrado!"}`))
		return
	}

}
