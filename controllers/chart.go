package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

type ChartController struct {
	beego.Controller
}

func (c *ChartController) Get() {

	var name string
	c.Ctx.Input.Bind(&name, "name")
	l := logs.GetLogger()

	c.Data["chart"] = getCharts()[name]

	l.Println(getCharts()[name])

	c.TplName = "chart.tpl"
}
