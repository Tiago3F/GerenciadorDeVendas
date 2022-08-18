package external_server

import (
	"crudItem/modules/base/domain/repository"
	"crudItem/modules/base/interface/external-server/grpc/pb"
	"crudItem/modules/base/usecases"
	"fmt"
)

type ItemGRPC struct {
	pb.UnimplementedItemServer
	it repository.IItemRepository
}

// constructor
func NewItemGRPC(it repository.IItemRepository) pb.ItemServer {
	return &ItemGRPC{
		it: it,
	}
}

func (c *ItemGRPC) GetItems(in *pb.Empty, stream pb.Item_GetItemsServer) error {

	getItemUseCase := usecases.NewGetItemUseCase(c.it)

	items, err := getItemUseCase.GetItems()
	if err != nil {
		return err
	}

	for _, item := range *items {

		itemStreamGRPC := pb.ItemEntity{
			Id:        fmt.Sprint(item.ID),
			Descricao: item.Descricao,
			Sn:        item.Sn,
			Mac:       item.Mac,
			Imei:      item.Imei,
			// LocalidadeId: fmt.Sprint(item.Localidade_id),
		}

		if err := stream.Send(&itemStreamGRPC); err != nil {
			return err
		}
	}

	return nil

}
