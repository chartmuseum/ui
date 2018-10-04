package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

type UploadChartController struct {
	beego.Controller
}

func (this *UploadChartController) Post() {

	l := logs.GetLogger()
	l.Println("**UploadFile**")
	file, header, er := this.GetFile("chart")

	if er != nil {
		l.Println(er)
	}

	filePath := "/tmp/" + header.Filename

	if file != nil {
		l.Println("fileName:" + filePath)
		err := this.SaveToFile("file", filePath)

		if err != nil {
			l.Println("SaveToFile", err.Error)
		}
	}

	uploadChart(filePath)

}
