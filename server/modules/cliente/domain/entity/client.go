package entity

type Cliente struct {
	ID     int    `json:"id"`
	Cpf    string `json:"cpf"`
	Nome   string `json:"nome"`
	Limite int    `json:"limite"`
	Cc     int    `json:"cc"`
}

type Clientes = []Cliente
