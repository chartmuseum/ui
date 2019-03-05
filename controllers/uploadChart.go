package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// UploadChartController handles requests for uploading new charts to ChartMuseum
type UploadChartController struct {
	beego.Controller
}

// Post receives a chart and sends it to ChartMuseum
func (u *UploadChartController) Post() {

	l := logs.GetLogger()
	l.Println("**UploadFile**")
	file, header, er := u.GetFile("chart")

	if er != nil {
		l.Println(er)
	}

	filePath := "/tmp/" + header.Filename

	if file != nil {
		l.Println("fileName:" + filePath)
		err := u.SaveToFile("chart", filePath)

		if err != nil {
			l.Println("*SaveToFile*", err.Error)
		}
	}
	l.Println("going into uploadChart()")
	uploadChart(filePath)

}
