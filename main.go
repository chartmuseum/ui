package main

import (
	_ "quickstart/routers"

	_ "github.com/astaxie/beego/session/mysql"

	"github.com/astaxie/beego"
)

func main() {
	//beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Run()
}
