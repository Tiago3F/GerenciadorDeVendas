package app

import (
	"encoding/json"
	"log"
	"net/http"
)

//errorMessage representa um erro que pode ocorrer na aplicação
type errorMessage struct {
	Code   int    `json:"code"`
	Status string `json:"status"`
	Detail string `json:"detail"`
}

//UnprocessableEntity retorna uma resposta para o status HTTP 422
func UnprocessableEntity(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusUnprocessableEntity)

	data := errorMessage{
		Code:   http.StatusUnprocessableEntity,
		Status: http.StatusText(http.StatusUnprocessableEntity),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//BadRequest retorna uma resposta para o status HTTP 400
func BadRequest(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusBadRequest)

	data := errorMessage{
		Code:   http.StatusBadRequest,
		Status: http.StatusText(http.StatusBadRequest),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//Conflict retorna uma resposta para o status HTTP 409
func Conflict(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusConflict)

	data := errorMessage{
		Code:   http.StatusConflict,
		Status: http.StatusText(http.StatusConflict),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//InternalServerError retorna uma resposta para o status HTTP 500
func InternalServerError(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusInternalServerError)

	data := errorMessage{
		Code:   http.StatusInternalServerError,
		Status: http.StatusText(http.StatusInternalServerError),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//NotFound retorna uma resposta para o status HTTP 404
func NotFound(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusNotFound)

	data := errorMessage{
		Code:   http.StatusNotFound,
		Status: http.StatusText(http.StatusNotFound),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//Forbidden retorna uma resposta para o status HTTP 403
func Forbidden(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusForbidden)

	data := errorMessage{
		Code:   http.StatusForbidden,
		Status: http.StatusText(http.StatusForbidden),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//Unauthorized retorna uma resposta para o status HTTP 401
func Unauthorized(err error, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusUnauthorized)

	data := errorMessage{
		Code:   http.StatusUnauthorized,
		Status: http.StatusText(http.StatusUnauthorized),
		Detail: err.Error(),
	}

	_ = json.NewEncoder(w).Encode(data)
}

//OK retorna uma resposta para o status HTTP 200
func OK(data interface{}, w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	_ = json.NewEncoder(w).Encode(data)
}

// DisplayFile serve um arquivo dinamicamente
func DisplayFile(file []byte, name string, inline bool, w http.ResponseWriter) {
	var s string

	if inline {
		s = "inline"
	} else {
		s = "attachment; filename=\"" + name + "\""
	}

	w.Header().Set("Content-Disposition", s)
	w.WriteHeader(http.StatusOK)
	_, _ = w.Write(file)
}

// mensagem em JSON
func JSON(w http.ResponseWriter, statusCode int, dados interface{}) {
	w.Header().Set("Content-Type", "application/json") // retorna em forma de json
	w.WriteHeader(statusCode)

	if dados != nil {
		if erro := json.NewEncoder(w).Encode(dados); erro != nil {
			log.Fatal(erro)
		}
	}
}

//Erro retorno um erro em formato json
func Erro(w http.ResponseWriter, statusCode int, erro error) {
	JSON(w, statusCode, struct {
		Erro string `json:"erro"`
	}{
		Erro: erro.Error(),
	})
}
