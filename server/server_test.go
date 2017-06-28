package server

import "testing"

func TestApiVersion(t *testing.T) {
	expected := "v1"
	observed := apiVersion()
	if observed != expected {
		t.Errorf("TestApiVersion() -> observed: %s, expected: %s", observed, expected)
	}
}
