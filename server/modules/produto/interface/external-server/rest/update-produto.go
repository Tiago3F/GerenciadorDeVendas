package external_server

import (
	"crudItem/modules/produto/domain/entity"
	updateProduto "crudItem/modules/produto/usecases/updateProduto"
	"encoding/json"

	"net/http"
)

func (pr *ProdutoHandle) UpdateProduto(w http.ResponseWriter, r *http.Request) {
	var prod entity.Produto
	err := json.NewDecoder(r.Body).Decode(&prod)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	updateProduto := updateProduto.NewPutProdutoUseCase(pr.repo)

	result, err := updateProduto.UpdateProduto(prod)
	if err != nil {
		w.Write([]byte(err.Error()))
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(result)
}
