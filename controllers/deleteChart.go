package controllers

import (
	"fmt"
	"os"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

type DeleteChartController struct {
	beego.Controller
}

type Chart struct {
	Name    interface{} `form:"name"`
	Version interface{} `form:"version"`
}

func (this *DeleteChartController) Post() {

	l := logs.GetLogger()
	l.Println("in DELETE")
	chart := Chart{}
	if err := this.ParseForm(&chart); err != nil {
		l.Println("Error in login form")
		os.Exit(1)
	} else {
		name := fmt.Sprintf("%s", chart.Name)
		version := fmt.Sprintf("%s", chart.Version)
		l.Println("into deleteChart()")
		deleteChart(name, version)
	}
}
