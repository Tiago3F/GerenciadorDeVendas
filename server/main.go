package main

import (
	"crudItem/shared/config"
	"crudItem/shared/db"
	"crudItem/shared/logger"
	"crudItem/shared/servers/grpc_server"
	"crudItem/shared/servers/rest_server"

	_ "crudItem/docs"

	"go.uber.org/fx"
)

// @title       Gerenciador de vendas
// @versão      1.0
// @description Api de gerenciamento de vendas

// @host     localhost:3333

// @securityDefinitions.basic BasicAuth
func main() {

	// inicia todas as dependencias
	app := fx.New(
		fx.Provide(

			// log
			logger.Init,

			// Rest
			config.GetParamsDb,
			db.NewRepository,
			rest_server.NewChi,

			// grpc
			grpc_server.InitGRPCserver,
		),

		fx.Invoke(
			rest_server.RegisterRoutes,
			grpc_server.RunGRPCServer,
			grpc_server.RegisterGrpcModules,
		),
	)

	// inicia aplicação
	app.Run()

}
