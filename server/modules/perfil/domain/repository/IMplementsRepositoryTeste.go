package repository

type PerfilRepositoryTeste struct {
}

//var PerfilsDb []entity.Perfil

//var _ IPerfilRepository = &PerfilRepositoryTeste{}

func NewPerfilRepositoryTeste() *PerfilRepositoryTeste {
	return &PerfilRepositoryTeste{}
}

/*func (*PerfilRepositoryTeste) DeleteItem(id string) (bool, error) {

	newPerfil := make([]entity.Perfil, 0)
	isDeleted := false

	for _, item := range PerfilsDb {
		if fmt.Sprint(item.ID) != id {
			newPerfil = append(newPerfil, item)
		} else {
			isDeleted = true
		}
	}

	PerfilsDb = newPerfil

	return isDeleted, nil
}*/
