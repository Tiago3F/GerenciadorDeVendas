package usecases

import (
	"crudItem/modules/base/domain/repository"
)

type DeleteItemUseCase struct {
	repository repository.IItemRepository
}

func NewDeleteItemUseCase(repo repository.IItemRepository) *DeleteItemUseCase {
	return &DeleteItemUseCase{
		repository: repo,
	}
}

func (it *DeleteItemUseCase) DeleteItems(id string) (bool, error) {
	result, err := it.repository.DelteItem(id)

	if err != nil {
		return false, err
	}

	return result, nil

}
