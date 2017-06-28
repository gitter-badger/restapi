package server

import (
	"net/http"

	"gopkg.in/gin-gonic/gin.v1"
)

type response struct {
	Message string `json:"message"`
}

func pingHandler() gin.HandlerFunc {
	resp := &response{"pong"}
	return func(c *gin.Context) {
		c.JSON(http.StatusOK, resp)
	}
}
