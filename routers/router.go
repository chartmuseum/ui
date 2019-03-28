package routers

import (
	"os"

	"github.com/chartmuseum/ui/controllers"
	"github.com/chartmuseum/ui/services"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/plugins/auth"
)

func init() {
	setupAuthentication()

	beego.Router("/", &controllers.MainController{})
	//beego.Router("/login", &controllers.LogInController{})
	beego.Router("/delete", &controllers.DeleteChartController{})
	beego.Router("/receive", &controllers.UploadChartController{})
	beego.Router("/home", &controllers.MainController{})
	beego.Router("/home/chart/?:name", &controllers.ChartController{})
	beego.Router("/chart/?:name", &controllers.ChartController{})
}

func setupAuthentication() {
	l := logs.GetLogger()

	userJson := os.Getenv("BASIC_AUTH_USERS")
	if len(userJson) != 0 {
		l.Println("Using basic auth")
		authPlugin := auth.NewBasicAuthenticator(services.SecretAuth, "Authorization Required")
		beego.InsertFilter("*", beego.BeforeRouter, authPlugin, true)
	}
}
