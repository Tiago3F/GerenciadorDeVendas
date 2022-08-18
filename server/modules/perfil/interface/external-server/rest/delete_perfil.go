package external_server

import (
	deletePerfilUseCases "crudItem/modules/perfil/usecases/deletePerfil"
	"net/http"

	"github.com/go-chi/chi/v5"
)

//construtor
func (perfil *PerfilHandle) DeletePerfil(w http.ResponseWriter, r *http.Request) {
	perfil_id := chi.URLParam(r, "id")

	deletePerfilUseCase := deletePerfilUseCases.NewDeletePerfilUseCase(perfil.repo)

	result, err := deletePerfilUseCase.DeletePerfil(perfil_id)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	if result {
		w.WriteHeader(http.StatusNotFound)
		w.Write([]byte(`{"Mensagem": "Nenhum perfil encontrado!"}`))
		return
	}
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(`{"Mensagem": "Perfil deletado com sucesso!"}`))
	return
}
