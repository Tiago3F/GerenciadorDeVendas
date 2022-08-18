package config

import "os"

type ConfigParamsDb struct {
	AuthGormPostgresParams AuthPostgres
	//AuthPgxPostgresParams AuthPostgres
}

type AuthPostgres struct {
	DB_USER, DB_PASSWORD, DB_PORT, DB_HOST, DB_NAME string
}

func GetParamsDb() ConfigParamsDb {
	//paramsPgx := GetPgxParams()
	paramsGorm := GetGormParams()

	return ConfigParamsDb{
		AuthGormPostgresParams: paramsGorm,
		//AuthPgxPostgresParams: paramsPgx,
	}
}

func GetGormParams() AuthPostgres {
	// GORM
	DB_USER := os.Getenv("DB_USER")
	DB_PASSWORD := os.Getenv("DB_PASSWORD")
	DB_PORT := os.Getenv("DB_PORT")
	DB_HOST := os.Getenv("DB_HOST")
	DB_NAME := os.Getenv("DB_NAME")

	// seta valor para teste caso não haja variaveis de ambiente'
	if len(DB_HOST) <= 0 {
		DB_HOST = "database" //ip do container docker, consulte com "$ docker inspect (nome do container ou pid) | grep "IPAddress""
	}

	if len(DB_NAME) <= 0 {
		DB_NAME = "root"
	}

	if len(DB_PASSWORD) <= 0 {
		DB_PASSWORD = "root"
	}

	if len(DB_PORT) <= 0 {
		DB_PORT = "5432"
	}

	if len(DB_USER) <= 0 {
		DB_USER = "root"
	}

	return AuthPostgres{
		DB_USER,
		DB_PASSWORD,
		DB_PORT,
		DB_HOST,
		DB_NAME,
	}
}

// func GetPgxParams() AuthPostgres {

// 	DB_USER := os.Getenv("DB_USER")
// 	DB_PASSWORD := os.Getenv("DB_PASSWORD")
// 	DB_PORT := os.Getenv("DB_PORT")
// 	DB_HOST := os.Getenv("DB_HOST")
// 	DB_NAME := os.Getenv("DB_NAME")

// 	// seta valor para teste caso não haja variaveis de ambiente'
// 	if len(DB_HOST) <= 0 {
// 		DB_HOST = "database" //ip do container docker, consulte com "$ docker inspect (nome do container ou pid) | grep "IPAddress""
// 	}

// 	if len(DB_NAME) <= 0 {
// 		DB_NAME = "root"
// 	}

// 	if len(DB_PASSWORD) <= 0 {
// 		DB_PASSWORD = "root"
// 	}

// 	if len(DB_PORT) <= 0 {
// 		DB_PORT = "5432"
// 	}

// 	if len(DB_USER) <= 0 {
// 		DB_USER = "root"
// 	}

// 	return AuthPostgres{
// 		DB_USER,
// 		DB_PASSWORD,
// 		DB_PORT,
// 		DB_HOST,
// 		DB_NAME,
// 	}
// }
