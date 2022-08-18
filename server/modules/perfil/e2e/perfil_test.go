package e2e

// import (
// 	"crudItem/modules/perfil/domain/entity"
// 	"fmt"
// 	"net/http"

// 	"github.com/stretchr/testify/assert"
// )

// func (s *Suite) TestPerfil(){

// 	s.Run("E2e: Deve retornar uma mensagem de erro quando não houver perfis cadastrados", func() {

// 	factory := Perfil_test_factory{}

// 	_, err := factory.ClearDb()
// 	if err != nil {
// 		s.T().Error("Failed to clear database", err)
// 	}

// 	//Create Request
// 	req, _ := http.NewRequest("POST", "/perfil", nil)

// 	//Execute Request
// 	resp := s.executeRequest(req, s.server)

// 	assert.Equal(s.T(), 200, resp.Code)
// 	assert.Equal(s.T(), `{"error":"Não foi possível criar perfil"}`, resp.Body.String())
// })

// 	s.Run("E2e: Deve deletar um perfil", func() {

// 		factory :=  NewPerfilTest()

// 		perfilDb, errPer := factory.CreatePerfil(
// 			entity.Perfil{
// 				ID: 1,
// 				Nome: "Exemplo asodnbaiusb",
// 			},
// 		)
// 		if errPer != nil {
// 			s.T().Error("Failed to delete perfil:", errPer)
// 		}

// 	//Create new request
// 		req, _ := http.NewRequest("DELETE", fmt.Sprintf("/perfil/%v", perfilDb.ID),nil)

// 		// Execute Request
// 		resp := s.executeRequest(req, s.server)

// 		assert.Equal(s.T(), resp.Code, 200)
// 		assert.Equal(s.T(), `{"msg": "Perfil deletado com sucesso!"}`,resp.Body.String())
// 	})

// }