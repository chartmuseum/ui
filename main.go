package main

import (
	_ "github.com/chartmuseum/ui/routers"

	"github.com/astaxie/beego"
)

func main() {
	//beego.BConfig.WebConfig.Session.SessionOn = true
	beego.Run()
}
