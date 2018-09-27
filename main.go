package main

import (
	_ "quickstart/routers"

	"github.com/astaxie/beego"
)

func main() {
	//beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Run()
}
