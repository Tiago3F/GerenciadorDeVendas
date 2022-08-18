package grpc_server

import (
	//item_handle_grpc "crudItem/modules/base/interface/external-server/grpc/handle_grpc"
	//item_pb "crudItem/modules/base/interface/external-server/grpc/pb"
	"crudItem/shared/db"

	"google.golang.org/grpc"
)

func RegisterGrpcModules(srv *grpc.Server, repo *db.IRepositories) {

	// items
	//item_pb.RegisterItemServer(srv, item_handle_grpc.NewItemGRPC(repo.Item))
}
