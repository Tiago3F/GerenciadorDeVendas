package external_server

import (
	"crudItem/modules/cliente/domain/entity"
	postClientUseCase "crudItem/modules/cliente/usecases/postClient"
	"encoding/json"
	"net/http"
)

func (c *ClienteHandle) PostClient(w http.ResponseWriter, r *http.Request) {

	var body entity.Cliente
	err := json.NewDecoder(r.Body).Decode(&body)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	postClientUseCase := postClientUseCase.NewPostClientUseCase(c.repo)

	client, err := postClientUseCase.PostClient(body)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	json.NewEncoder(w).Encode(client)
	w.WriteHeader(http.StatusOK)
}
