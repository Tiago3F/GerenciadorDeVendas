package external_server

import (
	"crudItem/modules/cliente/domain/entity"
	updateCLientUseCase "crudItem/modules/cliente/usecases/updateCliente"
	"crudItem/shared/servers/rest_server/app"
	"encoding/json"
	"net/http"
)

func (c *ClienteHandle) UpdateCliente(w http.ResponseWriter, r *http.Request) {
	var cli entity.Cliente

	err := json.NewDecoder(r.Body).Decode(&cli)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	updateClient := updateCLientUseCase.NewUpdateClientUseCase(c.repo)

	cliente, err := updateClient.UpdateCliente(cli)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	//w.WriteHeader(http.StatusOK)
	app.JSON(w, http.StatusOK, nil)
	json.NewEncoder(w).Encode(cliente)
}
