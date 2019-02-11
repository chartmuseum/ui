package models

import (
	"encoding/json"
)

type Error struct {
	Message        string       `json:"error"`
}

func NewError(data []byte) (Error, error) {
	var e Error
	err := json.Unmarshal(data, &e)
	return e, err
}
