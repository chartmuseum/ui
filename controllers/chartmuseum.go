package controllers

import (
	"os"
	"quickstart/models"

	"github.com/astaxie/beego/httplib"
	"github.com/astaxie/beego/logs"
)

func getCharts() map[string][]models.Chart {

	l := logs.GetLogger()
	res, err := httplib.Get(os.Getenv("CHART_MUSESUM_URL") + api_get_charts).Debug(true).Bytes()
	if err != nil {
		l.Panic(err.Error)
	}

	charts, err := models.NewCharts(res)
	if err != nil {
		l.Panic(err)
	}
	return charts
}
