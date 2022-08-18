package external_server

import (
	"crudItem/modules/perfil/domain/entity"
	postPerfilUseCase "crudItem/modules/perfil/usecases/postPerfil"

	"encoding/json"
	"net/http"
)

// @Summary     Cria um perfil
// @Description cria um perfil descrição
// @Tags        perfil
// @Accept      json
// @Produce     json
// @Param       perfil body     entity.Perfil true "payload" Format(entity.Perfil)
// @Success     201    {array}  entity.Perfil
// @Failure     500    {object} error
// @Router      /perfil [post]
func (p *PerfilHandle) PostPerfil(w http.ResponseWriter, r *http.Request) {

	var perBody entity.Perfil

	err := json.NewDecoder(r.Body).Decode(&perBody)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	postPerfilUseCase := postPerfilUseCase.NewPostPerfilUseCase(p.repo)

	Perfil, err := postPerfilUseCase.PostPerfil(perBody)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	w.WriteHeader(http.StatusCreated)

	json.NewEncoder(w).Encode(Perfil)

}
