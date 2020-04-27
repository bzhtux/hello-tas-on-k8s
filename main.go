package main

import (
	"os"
	"net/http"

	"github.com/labstack/echo"
)

func main() {
	appPort := os.Getenv("APP_PORT")
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello TAS on Kubernetes")
	})
	e.Logger.Fatal(e.Start(":"+appPort))
}
