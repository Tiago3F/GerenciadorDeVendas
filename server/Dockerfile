# FROM golang:1.18-alpine
FROM golang:1.18 AS builder

WORKDIR /app

COPY . .
# CGO_ENABLED=0 -> Não buscar nada da lib c
# GOOS=linux -> define o sistema que o binario será gerado
RUN CGO_ENABLED=0 GOOS=linux GOARC=amd64 go build -o server

FROM scratch

COPY --from=builder /app/server /server

ENTRYPOINT [ "/server" ]
