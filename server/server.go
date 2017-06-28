package server

import (
	"log"

	"gopkg.in/gin-gonic/gin.v1"
)

// Start triggers the server initialization
// serving on localhost:8000 by default
func Start(port string) {
	if port != "" {
		port = "8000"
	}

	r := gin.Default()

	// Register resource handlers
	v1 := r.Group("/" + apiVersion())
	v1.GET("/ping", pingHandler())

	if err := r.Run(port); err != nil {
		log.Fatalf("failed to start server on port '%s': %s", port, err)
	}
}

func apiVersion() string {
	return "v1"
}
