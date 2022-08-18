package external_server

import (
	"net/http"
	"strconv"

	deleteClientUsecases "crudItem/modules/cliente/usecases/deleteClient"
	"crudItem/shared/servers/rest_server/app"

	"github.com/go-chi/chi/v5"
)

func (c *ClienteHandle) DeleteClient(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")

	newId, err := strconv.Atoi(id)
	if err != nil {
		app.Erro(w, http.StatusBadRequest, err)
		return
	}

	deleteClientUseCase := deleteClientUsecases.NewDeleteClientUseCase(c.repo)

	result := deleteClientUseCase.DeleteClient(newId)
	newResult, err := strconv.ParseBool(result)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	if newResult {
		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte(`{"Mensagem": "Nenhum cliente encontrado!"}`))
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte(`{"Mensagem": "Cliente deletado com sucesso!!"}`))
	return
}
