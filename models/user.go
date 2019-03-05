package models

import (
	"encoding/json"
)

type User struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func NewUsers(data []byte) ([]User, error) {
	var u []User
	err := json.Unmarshal(data, &u)
	return u, err
}
