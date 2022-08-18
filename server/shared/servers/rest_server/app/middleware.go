package app

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"strings"

	"google.golang.org/api/oauth2/v1"
	"google.golang.org/api/option"
)

type ctxKey struct{}
type key int

// HTTP middleware setting a value on the request context
func MiddlewareAuth(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		defer func() {
			if r := recover(); r != nil {
				err := fmt.Sprintln("Falha interna no servidor: ", r)
				InternalServerError(errors.New(err), w)
				return
			}
		}()

		auth := r.Header.Get("Authorization")

		// Verifica se contem o cabecalho bearer
		if !(strings.Contains(auth, "Bearer")) {
			Unauthorized(errors.New("Credenciais de autenticação inválidas!"), w)
			return
		}

		bearer := strings.Split(auth, " ")

		// Verifica se existe token
		if len(bearer) <= 1 {
			Unauthorized(errors.New("Credenciais de autenticação ausentes!"), w)
			return
		}

		if len(bearer) <= 0 {
			Unauthorized(errors.New("Credenciais de autenticação ausentes!"), w)
			return
		}

		// Valida token
		user, err := Valid(bearer[1])
		if err != nil {
			errorMessage := fmt.Sprintln("Credenciais de autenticação inválidas: ", err)
			Unauthorized(errors.New(errorMessage), w)
			return
		}

		log.Println("user: ", user)

		ctx := context.WithValue(r.Context(), "user", "")

		next.ServeHTTP(w, r.WithContext(ctx))

	})
}

//Validacao do token Oauth2 do google
func Valid(access_token string) (*oauth2.Tokeninfo, error) {

	ctx := context.Background()

	oauth2Service, err := oauth2.NewService(ctx, option.WithoutAuthentication())

	if err != nil {
		log.Println(err)
	}

	tokenInfo, err := oauth2Service.Tokeninfo().AccessToken(access_token).Do()

	// config := &oauth2.Config{}

	if err != nil {
		return tokenInfo, err
	}

	return tokenInfo, nil
}
