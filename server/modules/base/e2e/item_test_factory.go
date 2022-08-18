package external_server

import (
	entity "crudItem/modules/base/domain/entity"
	"crudItem/shared/config"
	"crypto/rand"
	"database/sql"
	"errors"
	"fmt"
	"time"

	_ "github.com/lib/pq"

	"github.com/google/uuid"
)

type Item_test_factory struct {
	Item entity.Item
}

func NewItemTestFfactory() Item_test_factory {
	return Item_test_factory{}
}

func conectDB() (*sql.DB, error) {

	params := config.GetParamsDb()

	DBURL := fmt.Sprintf("host=%s port=%s user=%s dbname=%s sslmode=disable password=%s",
		params.AuthGormPostgresParams.DB_HOST,
		params.AuthGormPostgresParams.DB_PORT,
		params.AuthGormPostgresParams.DB_USER,
		params.AuthGormPostgresParams.DB_NAME,
		params.AuthGormPostgresParams.DB_PASSWORD,
	)

	db, err := sql.Open("postgres", DBURL)
	if err != nil {
		return nil, err
	}

	return db, nil
}

func GenerateMac() (string, error) {
	buf := make([]byte, 6)
	_, err := rand.Read(buf)
	if err != nil {
		fmt.Println("error:", err)
		return "", err
	}

	// Set the local bit
	buf[0] |= 2
	mac := fmt.Sprintf("%02x:%02x:%02x:%02x:%02x:%02x\n", buf[0], buf[1], buf[2], buf[3], buf[4], buf[5])

	return mac, nil
}

func (s *Item_test_factory) CreateItem(item entity.Item) (*entity.Item, error) {

	item_id := uuid.Must(uuid.NewRandom())

	mac, err := GenerateMac()
	if err != nil {
		return nil, errors.New(fmt.Sprint("error generating mac: ", err))
	}

	db, err := conectDB()
	if err != nil {
		return nil, errors.New(fmt.Sprint("error connect database: ", err))
	}

	defer db.Close()

	var itemDb entity.Item

	errDb := db.QueryRow(`
		INSERT INTO 
			item(id, descricao, sn, mac, imei, criado_em) 
			VALUES($1, $2, $3, $4, $5, $6)
			RETURNING id, descricao, sn, mac, imei;
	`,
		item_id,
		item.Descricao,
		item.Sn,
		mac,
		item.Imei,
		time.Now(),
	).Scan(
		&itemDb.ID,
		&itemDb.Descricao,
		&itemDb.Sn,
		&itemDb.Mac,
		&itemDb.Imei,
	)

	if errDb != nil {
		return nil, errDb
	}

	return &itemDb, nil
}

func (s *Item_test_factory) DeleteItem(item_id string) (bool, error) {

	db, err := conectDB()
	if err != nil {
		return false, err
	}

	errDelete := db.QueryRow(`
	 	DELETE FROM item WHERE id=$1;`, item_id,
	).Scan()

	if err != nil {
		return false, errDelete

	}

	defer db.Close()

	return true, nil
}

func (s *Item_test_factory) ClearDb() (bool, error) {
	db, err := conectDB()
	if err != nil {
		return false, err
	}

	errDelete := db.QueryRow(`
	 	DELETE FROM item`,
	).Scan()

	if err != nil {
		return false, errDelete

	}

	defer db.Close()

	return true, nil
}
