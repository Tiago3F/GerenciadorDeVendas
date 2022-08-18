package rest_server

import (
	"crudItem/shared/db"

	handle_rest_item "crudItem/modules/base/interface/external-server/rest"
	handle_rest_cliente "crudItem/modules/cliente/interface/external-server/rest"
	handle_rest_perfil "crudItem/modules/perfil/interface/external-server/rest"

	handle_rest_produto "crudItem/modules/produto/interface/external-server/rest"

	httpSwagger "github.com/swaggo/http-swagger"

	"github.com/go-chi/chi/v5"
)

func RegisterRoutes(r *chi.Mux, handle *db.IRepositories) {

	// Instancias dos handlers das rotas
	items := handle_rest_item.NewItemHandler(handle.Item)
	perfil := handle_rest_perfil.NewPerfilHandler(handle.Perfil)
	cliente := handle_rest_cliente.NewClientHandler(handle.Cliente)
	produto := handle_rest_produto.NewProdutoHandler(handle.Produto)

	// midleware de autenticacao

	// r.Use(app.MiddlewareAuth)

	//Items
	r.Get("/items", items.GetItems)
	r.Post("/items", items.PostItems)
	r.Delete("/items/{id}", items.DeleteItems)

	//Perfil
	r.Delete("/perfil/{id}", perfil.DeletePerfil)
	r.Post("/perfil", perfil.PostPerfil)
	r.Put("/perfil", perfil.UpdatePerfil)
	r.Get("/perfil", perfil.FilteringByName)

	// Produto
	r.Post("/produto", produto.PostProduto)
	r.Patch("/produto", produto.UpdateProduto)

	r.Get("/swagger/*", httpSwagger.Handler(
		httpSwagger.URL("/swagger/doc.json"), //The url pointing to API definition
	))

	//Cliente
	r.Post("/cliente", cliente.PostClient)
	r.Patch("/cliente", cliente.UpdateCliente)
	r.Get("/cliente", cliente.GetClientName)
	r.Delete("/cliente/{id}", cliente.DeleteClient)
}
