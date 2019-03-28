package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// ChartController handles getting and displaying charts
type ChartController struct {
	beego.Controller
}

// Get render all versions of one specific chart
func (c *ChartController) Get() {

	l := logs.GetLogger()
	l.Println("into chart page")

	var name string
	c.Ctx.Input.Bind(&name, "name")

	c.Data["chart"] = getCharts()[name]

	l.Println(getCharts()[name])

	c.TplName = "chart.tpl"
}
