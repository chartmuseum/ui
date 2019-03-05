package models

import (
	"encoding/json"
)

// User reprecents a user that can login to ChartMuseumUI
type User struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

// NewUsers unmarshals a slice of users from Json
func NewUsers(data []byte) ([]User, error) {
	var u []User
	err := json.Unmarshal(data, &u)
	return u, err
}
