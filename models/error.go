package models

import (
	"encoding/json"
)

// Error reprecents an error received from ChartMuseum
type Error struct {
	Message string `json:"error"`
}

// NewError unmarshals a slice of errors from Json
func NewError(data []byte) (Error, error) {
	var e Error
	err := json.Unmarshal(data, &e)
	return e, err
}
