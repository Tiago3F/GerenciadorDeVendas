package entity

type Produto struct {
	ID      int     `json:"id"`
	Nome    string  `json:"nome"`
	Preco   float32 `json:"preco"`
	Unidade string  `json:"unidade"`
}

type Produtos []Produto
