package grpc_server

import (
	"context"
	"log"
	"net"

	db "crudItem/shared/db"

	"go.uber.org/fx"
	"google.golang.org/grpc"
)

func InitGRPCserver(repo *db.IRepositories) (*grpc.Server, net.Listener) {

	grpcServer := grpc.NewServer()

	listener, err := net.Listen("tcp", ":50055")
	if err != nil {
		log.Fatalf("Cannot start server: %v", err)
	}

	return grpcServer, listener
}

func RunGRPCServer(lc fx.Lifecycle, grpcServer *grpc.Server, listener net.Listener) error {

	lc.Append(fx.Hook{
		OnStart: func(ctx context.Context) error {
			go grpcServer.Serve(listener)

			return nil

		},

		OnStop: func(ctx context.Context) error {
			grpcServer.GracefulStop()
			return nil
		},
	})

	return nil
}
