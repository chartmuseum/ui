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
	c.TplName = "main.tpl"
}
