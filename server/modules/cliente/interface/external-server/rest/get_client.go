package external_server

import (
	"crudItem/modules/cliente/domain/dtos"
	getClientUseCase "crudItem/modules/cliente/usecases/getClient"
	"crudItem/shared/servers/rest_server/app"
	"encoding/json"
	"net/http"
)

func (c *ClienteHandle) GetClientName(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json") //retorna em formato JSON

	params := dtos.IGetCLientParams{
		Nome:   r.URL.Query().Get("nome"),
		Limite: r.URL.Query().Get("limite"),
		Offset: r.URL.Query().Get("offset"),
	}

	getClientUseCase := getClientUseCase.NewGetClientUseCase(c.repo)

	clientes, err := getClientUseCase.GetClientName(params)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}
	json.NewEncoder(w).Encode(clientes)
	app.JSON(w, http.StatusOK, nil)
	//w.WriteHeader(200)
	//w.WriteHeader(http.StatusOK)
}
