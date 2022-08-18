package rest_server

import (
	"context"

	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/cors"
	"go.uber.org/fx"
	"go.uber.org/zap"
)

// Cria servidor rest com chi
func NewChi(lc fx.Lifecycle, log *zap.Logger) (*chi.Mux, error) {

	r := chi.NewRouter()

	server := &http.Server{
		Addr:    ":3333",
		Handler: r,
	}

	//Adiciona logs das rotas
	r.Use(middleware.Logger)

	// Remove erros de barra dupla do caminho de solicitação
	r.Use(middleware.CleanPath)

	// CORS
	// for more ideas, see: https://developer.github.com/v3/#cross-origin-resource-sharing
	r.Use(cors.Handler(cors.Options{
		// AllowedOrigins:   []string{"https://foo.com"}, // Use this to allow specific origin hosts
		AllowedOrigins: []string{"https://*", "http://*"},
		// AllowOriginFunc:  func(r *http.Request, origin string) bool { return true },
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: false,
		MaxAge:           300, // Maximum value not ignored by any of major browsers
	}))

	lc.Append(fx.Hook{

		OnStart: func(context.Context) error {

			log.Info("Starting HTTP server.")

			go server.ListenAndServe()

			return nil
		},
		OnStop: func(ctx context.Context) error {
			log.Info("Stopping HTTP server.")
			return server.Shutdown(ctx)
		},
	})

	return r, nil
}
