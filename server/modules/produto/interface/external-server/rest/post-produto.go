package external_server

import (
	"crudItem/modules/produto/domain/entity"
	postProdutoUseCase "crudItem/modules/produto/usecases/postProduto"

	"encoding/json"
	"net/http"
)

func (p *ProdutoHandle) PostProduto(w http.ResponseWriter, r *http.Request) {

	var produt entity.Produto

	err := json.NewDecoder(r.Body).Decode(&produt)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	postProdutoUseCase := postProdutoUseCase.NewPostProdutoUseCase(p.repo)

	Produto, err := postProdutoUseCase.PostProduto(produt)
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	w.WriteHeader(http.StatusCreated)

	json.NewEncoder(w).Encode(Produto)

}
