package usecases

import (
	"crudItem/modules/base/domain/entity"
	"crudItem/modules/base/domain/repository"
)

type GetItemUseCase struct {
	repository repository.IItemRepository
}

func NewGetItemUseCase(repo repository.IItemRepository) *GetItemUseCase {
	return &GetItemUseCase{
		repository: repo,
	}
}

// GetItem implements repository.IItemRepository
func (it *GetItemUseCase) GetItems() (*[]entity.Item, error) {

	// facadeLocalidade, err := factory.CreateLocalidadeFactoryFacade()
	// if err != nil {
	// 	return nil, err
	// }

	// items
	items, err := it.repository.GetItems()
	if err != nil {
		return nil, err
	}

	// remove eferencia ao ponteiro retornado por 'it.repository.GetItems()'
	// newItems := *items

	// for index, item := range newItems {
	// 	localidade := facadeLocalidade.GetLocalidadeById(item.Localidade_id)

	// 	newItems[index].SetLocation(localidade.Nome, "unimplemented field")
	// }

	return items, nil
}
