package external_server

import (
	"crudItem/shared/config"
	"crudItem/shared/db"
	"crudItem/shared/logger"
	"net/http"
	"net/http/httptest"
	"testing"

	rest "crudItem/modules/base/interface/external-server/rest"

	_ "github.com/lib/pq"

	"github.com/go-chi/chi/v5"
	"github.com/stretchr/testify/suite"
)

type Suite struct {
	suite.Suite
	server *chi.Mux
}

// before each test
func (suite *Suite) SetupTest() {

	log, err := logger.Init()
	if err != nil {
		suite.T().Error("failed to initialize log : ", err)
	}

	// clear db
	// factory := NewItemTestFfactory()
	// factory.ClearDb()

	// Create server
	suite.server = chi.NewRouter()

	// init repository
	configDb := config.GetParamsDb()
	repo, err := db.NewRepository(configDb, log)
	if err != nil {
		suite.T().Error("failed to initialize database: ", err)
	}

	// Init routes
	items := rest.NewItemHandler(repo.Item)
	suite.server.Get("/items", items.GetItems)
	suite.server.Post("/items", items.PostItems)
	suite.server.Delete("/items/{id}", items.DeleteItems)

}

// UTILS--------
func (suite *Suite) executeRequest(req *http.Request, s *chi.Mux) *httptest.ResponseRecorder {
	rr := httptest.NewRecorder()
	s.ServeHTTP(rr, req)

	return rr
}

// RUN SUITE_TEST
func TestItemSuite(t *testing.T) {
	suite.Run(t, new(Suite))
}
