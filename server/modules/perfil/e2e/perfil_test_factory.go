package e2e

// import (
// 	"context"
// 	"crudItem/modules/perfil/domain/entity"
// 	"crudItem/shared/config"
// 	"errors"
// 	"fmt"

// 	"github.com/jackc/pgx/v5"
// )

// type Perfil_test_factory struct {
// 	Perfil entity.Perfil
// }

// func NewPerfilTest() Perfil_test_factory {
// 	return Perfil_test_factory{}
// }

// func conectDB() (*pgx.Conn, error) {

// 	params := config.GetParamsDb()

// DBURL := fmt.Sprintf("host=%s port=%s user=%s dbname=%s sslmode=disable password=%s",
// 	params.AuthPgxPostgresParams.DB_HOST,
// 	params.AuthPgxPostgresParams.DB_PORT,
// 	params.AuthPgxPostgresParams.DB_USER,
// 	params.AuthPgxPostgresParams.DB_NAME,
// 	params.AuthPgxPostgresParams.DB_PASSWORD,
// )

// db, err := pgx.Connect(context.Background(), DBURL)
// 	if err != nil {
// 		return nil, err
// 	}
// 	defer db.Close(context.Background())

// 	return db, nil
// }

// func (s *Perfil_test_factory) CreatePerfil(perfil entity.Perfil) (*entity.Perfil, error) {

// 	db, err := conectDB()
// 	if err != nil {
// 		return nil, errors.New(fmt.Sprint("error to conect database: ", err))
// 	}

// 	defer db.Close(context.Background())

// 	var perfilDb entity.Perfil

// 	errPdb := db.QueryRow(context.Background(),`INSERT INTO perfil (nome) VALUES ($1)`,perfil.Nome).Scan(&perfilDb.Nome)

// 	if errPdb != nil {
// 		return nil, errPdb
// 	}
// 	return &perfilDb, nil
// }

// func (s *Perfil_test_factory) DeletePerfil(perfil_nome string) (bool, error) {
// 	db, err := conectDB()
// 	if err!= nil {
// 		return false, err
// 	}

// 	errDel := db.QueryRow(context.Background(),`DELETE FROM Perfil WHERE nome`, perfil_nome).Scan()
// 	if errDel!=nil {
// 		return false, errDel
// 	}
// 	defer db.Close(context.Background())
// 	return true, nil
// }

// func (s *Perfil_test_factory) ClearDb() (bool, error) {

// 	db, err := conectDB()
// 	if err != nil {
// 		return false, err
// 	}

// 	errDel :=  db.QueryRow(context.Background(),`DELETE FROM perfil`).Scan()

// 	if errDel != nil {
// 		return false, errDel
// 	}

// 	defer db.Close(context.Background())

// 	return true, nil
// }