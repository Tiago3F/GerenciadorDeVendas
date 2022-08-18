package entity

import "github.com/google/uuid"

type Item struct {
	ID        uuid.UUID `json:"id"`
	Descricao string    `json:"descricao"`
	Sn        string    `json:"sn"`
	Mac       string    `json:"mac"`
	Imei      string    `json:"imei"`
}

type Items = []Item
