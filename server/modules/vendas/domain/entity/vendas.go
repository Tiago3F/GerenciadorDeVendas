package entity

type Vendas struct {
	Id             int16   `json:"id"`
	Client_id      int16   `json:"client_id"`
	Dataehora      string  `json:"dataehora"`
	Total          float32 `json:"total"`
	Desconto_total float32 `json:"desconto_total"`
}
