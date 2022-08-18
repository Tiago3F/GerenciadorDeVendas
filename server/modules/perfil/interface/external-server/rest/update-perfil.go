package external_server

import (
	"crudItem/modules/perfil/domain/entity"
	updatePerfil "crudItem/modules/perfil/usecases/updatePerfil"
	"encoding/json"
	"net/http"
)

// @Summary     Atualiza um perfil
// @Description Atualiza um perfil descrição
// @Tags        perfil
// @Accept      json
// @Produce     json
// @Param       perfil body     entity.Perfil true "payload" Format(entity.Perfil)
// @Success     200    {array}  entity.Perfil
// @Failure     500    {object} error
// @Router      /perfil [patch]
func (p *PerfilHandle) UpdatePerfil(w http.ResponseWriter, r *http.Request) {

	var perfil entity.Perfil

	err := json.NewDecoder(r.Body).Decode(&perfil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	updatePerfil := updatePerfil.NewUpdatePerfilUsacase(p.repo)

	newPerfil, err := updatePerfil.UpdatePerfil(perfil)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	w.WriteHeader(http.StatusOK)

	json.NewEncoder(w).Encode(newPerfil)
}
