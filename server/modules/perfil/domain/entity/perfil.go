package entity

type Perfil struct {
	ID   int    `json:"id" valid:"notnull"`
	Nome string `json:"nome" valid:"notnull"`
}

type Perfis = []Perfil

/*func init() {
	govalidator.SetFieldsRequiredByDefault(true)
}

func NewPerfilTeste(id int, nome string) (*Perfil, error) {
	perfil := &Perfil{ //construtor
		ID:   id,
		Nome: nome,
	}

	err := perfil.Prepare()

	if err != nil {
		return nil, err
	}

	return perfil, nil
}

func (Perfil *Perfil) Prepare() error {

	err := Perfil.validate()

	if err != nil {
		return err
	}

	return nil
}

func (Perfil *Perfil) validate() error {
	_, err := govalidator.ValidateStruct(Perfil)

	if err != nil {
		return err
	}

	return nil
}*/
