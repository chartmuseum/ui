package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

const api_get_charts = "/api/charts"

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	l := logs.GetLogger()
	l.Println("I'm alive")
	c.Data["charts"] = getCharts()
	c.Data["Website"] = "https://github.com/idobry"
	c.Data["Email"] = "idob@codevalue.net"
	c.TplName = "main.tpl"
}
