package controllers

import (
	"os"
	"os/exec"
	"fmt"

	"github.com/chartmuseum/ui/models"

	"github.com/astaxie/beego/httplib"
	"github.com/astaxie/beego/logs"
)

const apiGetCharts = "/api/charts"

func getCharts() map[string][]models.Chart {

	l := logs.GetLogger()
	l.Printf("Getting charts on url: %s\n", getBaseURL())

	cmUsername := os.Getenv("CHART_MUSEUM_USERNAME")
	cmPassword := os.Getenv("CHART_MUSEUM_PASSWORD")

	res, err := httplib.Get(getBaseURL()).SetBasicAuth(cmUsername, cmPassword).Debug(true).Bytes()
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

	cmUsername := os.Getenv("CHART_MUSEUM_USERNAME")
	cmPassword := os.Getenv("CHART_MUSEUM_PASSWORD")
	curlUserCrednentials := fmt.Sprintf("%s:%s",cmUsername, cmPassword)

	cmd := exec.Command("curl", "-u", curlUserCrednentials, "-L", "--data-binary", "@"+filePath, getBaseURL())
	out, err := cmd.CombinedOutput()
	if err != nil {
		l.Fatalf("cmd.Run() failed with %s\n", err)
	}
	l.Printf("combined out:\n%s\n", string(out))
}

func deleteChart(name string, version string) {

	l := logs.GetLogger()
	l.Println("in deleteChart()")

	cmUsername := os.Getenv("CHART_MUSEUM_USERNAME")
	cmPassword := os.Getenv("CHART_MUSEUM_PASSWORD")
	curlUserCrednentials := fmt.Sprintf("%s:%s",cmUsername, cmPassword)

	cmd := exec.Command("curl", "-u", curlUserCrednentials, "-X", "DELETE", getBaseURL()+"/"+name+"/"+version)
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
