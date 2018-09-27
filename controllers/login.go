package controllers

import (
	"database/sql"
	"os"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"

	_ "github.com/lib/pq"
)

var l = logs.GetLogger()

type Login struct {
	Username interface{} `form:"username"`
	Password interface{} `form:"password"`
}

type LogInController struct {
	beego.Controller
}

type LogInPage struct {
	beego.Controller
}

func (this *LogInController) Post() {
	l.Println("in POST")
	login := Login{}
	if err := this.ParseForm(&login); err != nil {
		l.Println("Error in login form")
		os.Exit(1)
	}

	//connStr := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=verify-full", os.Getenv("DB_HOST"), login.Username, login.Password, os.Getenv("DB_NAME"))
	connStr := "dbname=db user=user password=user host=postgres sslmode=disable"

	sqlConnect(connStr)

	this.Redirect("/home", 303)

}

func (this *LogInPage) Get() {
	this.TplName = "login.tpl"
}

func sqlConnect(connStr string) {
	l.Println("sql connect")
	l.Println(connStr)

	beego.BConfig.WebConfig.Session.SessionProvider = "postgresql"
	beego.BConfig.WebConfig.Session.SessionProviderConfig = "postgres://pqgotest:password@localhost/pqgotest?sslmode=verify-full"

	db, err := sql.Open("postgres", connStr)
	if err != nil {
		l.Println("Error in login form")
		os.Exit(1)
	}
	l.Println("error: " + err.Error())
	err = db.Ping()
	if err != nil {
		panic(err)
	}
	l.Println("successful login to db")
}
