package controllers

import (
	"fmt"
	"os"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// DeleteChartController handles requests for deleting charts from ChartMuseum
type DeleteChartController struct {
	beego.Controller
}

// Chart reprecents a helm chart to be deleted
type Chart struct {
	Name    interface{} `form:"name"`
	Version interface{} `form:"version"`
}

// Post handles delete requests from the ui
func (d *DeleteChartController) Post() {

	l := logs.GetLogger()
	l.Println("in DELETE")
	chart := Chart{}
	if err := d.ParseForm(&chart); err != nil {
		l.Println("Error in login form")
		os.Exit(1)
	} else {
		name := fmt.Sprintf("%s", chart.Name)
		version := fmt.Sprintf("%s", chart.Version)
		l.Println("into deleteChart()")
		deleteChart(name, version)
	}
}
