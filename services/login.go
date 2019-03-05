package services

import (
	"errors"
	"os"

	"github.com/chartmuseum/ui/models"

	"github.com/astaxie/beego/logs"
)

// SecretAuth validates that a password matches a given username
func SecretAuth(username, password string) bool {
	l := logs.GetLogger()

	users, err := getUsersFromEnv()
	if err != nil {
		l.Panic(err)
	}

	for _, user := range users {
		if username == user.Username && password == user.Password {
			return true
		}
	}
	return false
}

func getUsersFromEnv() ([]models.User, error) {

	l := logs.GetLogger()

	userJson := os.Getenv("BASIC_AUTH_USERS")
	if len(userJson) == 0 {
		return nil, errors.New("No users defined. Create environment var BASIC_AUTH_USERS")
	}

	users, err := models.NewUsers([]byte(userJson))
	if err != nil {
		l.Panic(err)
	}

	return users, nil
}
