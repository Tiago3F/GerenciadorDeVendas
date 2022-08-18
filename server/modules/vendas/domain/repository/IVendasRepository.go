package repository

import "crudItem/modules/vendas/domain/entity"

type ICreateSalesSTO struct {
	Client_id      int16   `json:"client_id"`
	Dataehora      string  `json:"dataehora"`
	Total          float32 `json:"total"`
	Desconto_total float32 `json:"desconto_total"`
}

type IVendasRepository interface {
	CreateSales(ICreateSalesSTO) entity.Vendas
}
