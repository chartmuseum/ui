package controllers

import (
	"os"
	"os/exec"

	"github.com/chartmuseum/ui/models"

	"github.com/astaxie/beego/httplib"
	"github.com/astaxie/beego/logs"
)

const apiGetCharts = "/api/charts"

func getCharts() map[string][]models.Chart {

	l := logs.GetLogger()
	l.Printf("Getting charts on url: %s\n", getBaseURL())
	res, err := httplib.Get(getBaseURL()).Debug(true).Bytes()
	if err != nil {
		l.Panic(err.Error)
	}

	charts, err := models.NewCharts(res)
	if err != nil {
		errorRes, innerErr := models.NewError(res)
		if innerErr != nil {
			l.Panic(innerErr)
		}
		l.Panicf("Error received from ChartMuseum application: %s\n", errorRes.Message, err)
	}
	return charts
}

func uploadChart(filePath string) {

	l := logs.GetLogger()

	cmd := exec.Command("curl", "-L", "--data-binary", "@"+filePath, getBaseURL())
	out, err := cmd.CombinedOutput()
	if err != nil {
		l.Fatalf("cmd.Run() failed with %s\n", err)
	}
	l.Printf("combined out:\n%s\n", string(out))
}

func deleteChart(name string, version string) {

	l := logs.GetLogger()
	l.Println("in deleteChart()")
	cmd := exec.Command("curl", "-X", "DELETE", getBaseURL()+"/"+name+"/"+version)
	out, err := cmd.CombinedOutput()
	if err != nil {
		l.Fatalf("cmd.Run() failed with %s\n", err)
	}
	l.Printf("combined out:\n%s\n", string(out))
}

func getBaseURL() string {
	api := os.Getenv("CHART_MUSEUM_API_GET_CHARTS")
	if len(api) == 0 {
		api = apiGetCharts
	}
	url := os.Getenv("CHART_MUSEUM_URL") + api
	return url
}
