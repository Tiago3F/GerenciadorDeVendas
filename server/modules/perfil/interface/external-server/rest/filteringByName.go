package external_server

import (
	GetByName "crudItem/modules/perfil/usecases/GetFilteringByName"
	"encoding/json"
	"net/http"

	"crudItem/modules/perfil/domain/dtos"
)

func (p *PerfilHandle) FilteringByName(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	params := dtos.IGetPerfilParams{
		Name:     r.URL.Query().Get("nome"),
		PageSize: r.URL.Query().Get("pageSize"),
		Offset:   r.URL.Query().Get("offset"),
	}

	GetFilterByName := GetByName.NewGetFilterByName(p.repo)

	result, err := GetFilterByName.GetFilter(params)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	json.NewEncoder(w).Encode(result)
	w.WriteHeader(200)
}
