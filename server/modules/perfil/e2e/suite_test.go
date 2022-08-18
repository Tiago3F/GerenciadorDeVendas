package e2e

// import (
// 	external_server "crudItem/modules/perfil/interface/external-server/rest"
// 	"crudItem/shared/config"
// 	"crudItem/shared/db"
// 	"crudItem/shared/logger"
// 	"net/http"
// 	"net/http/httptest"
// 	"testing"

// 	"github.com/go-chi/chi"
// 	"github.com/stretchr/testify/suite"
// )

// type Suite struct {
// 	suite.Suite
// 	server *chi.Mux
// }

// func (suite *Suite) SetupTest() {

// 	log, err := logger.Init()

// 	if err != nil {
// 		suite.T().Error("Failed to initialize log: ", err)
// 	}

// 	//Create server
// 	suite.server = chi.NewRouter()

// 	//init repository
// 	configDb := config.GetParamsDb()
// 	repo, err := db.NewRepository(configDb, log)
// 	if err != nil {
// 		suite.T().Error("not connect to database: ")
// 	}
// 	//init route
// 	profile := external_server.NewPerfilHandler(repo.Perfil)

// 	suite.server.Post("/perfil", profile.PostPerfil)
// }

// func (suite *Suite) executeRequest(req *http.Request, s *chi.Mux) *httptest.ResponseRecorder {
// 	rr := httptest.NewRecorder()

// 	s.ServeHTTP(rr, req)
// 	return rr

// }

// func TestPerfilSuite(t *testing.T){
// 	suite.Run(t, new(Suite))
// }