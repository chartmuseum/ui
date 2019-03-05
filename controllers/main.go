package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// MainController handles the front page
type MainController struct {
	beego.Controller
}

// Get renders a list with all charts in ChartMuseum
func (c *MainController) Get() {
	l := logs.GetLogger()
	l.Println("I'm alive")
	c.Data["charts"] = getCharts()
	c.TplName = "main.tpl"
}
