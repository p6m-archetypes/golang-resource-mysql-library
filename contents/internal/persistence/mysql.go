package persistence

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func Init(databaseURL string) error {
	conn, err := sql.Open("mysql", databaseURL)
	if err != nil {
		return fmt.Errorf("persistence: %w", err)
	}
	if err := conn.Ping(); err != nil {
		return fmt.Errorf("persistence: ping: %w", err)
	}
	db = conn
	return nil
}

func Close() {
	if db != nil {
		db.Close()
	}
}

func DB() *sql.DB {
	return db
}
