package controllers

import (
	"os"
	"quickstart/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/httplib"
	"github.com/astaxie/beego/logs"
)

const api_get_charts = "/api/charts"

type MainController struct {
	beego.Controller
}

func getCharts() []byte {

	l := logs.GetLogger()
	res, err := httplib.Get(os.Getenv("CHART_MUSESUM_URL") + api_get_charts).Debug(true).Bytes()
	if err != nil {
		l.Panic(err.Error)
	}

	return res
}

func (c *MainController) Get() {

	l := logs.GetLogger()
	l.Println("I'm alive")

	charts, err := models.NewCharts(getCharts())
	if err != nil {
		l.Panic(err)
	}

	c.Data["charts"] = charts
	c.Data["Website"] = "https://github.com/idobry"
	c.Data["Email"] = "idob@codevalue.net"
	c.TplName = "index.tpl"
}
