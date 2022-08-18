# !/bin/sh

# Run api local

export DB_HOST=localhost
export DB_NAME=root
export DB_PASSWORD=root
export DB_PORT=5437
export DB_USER=root

rm -rv ./*.bin; go build -v -o application.bin
./application.bin