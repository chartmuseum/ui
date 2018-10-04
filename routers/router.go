package routers

import (
	"quickstart/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//beego.Router("/login", &controllers.LogInController{})
	beego.Router("/delete", &controllers.DeleteChartController{})
	beego.Router("/receive", &controllers.UploadChartController{})
	beego.Router("/home", &controllers.MainController{})
	beego.Router("/home/chart/?:name", &controllers.ChartController{})
	beego.Router("/chart/?:name", &controllers.ChartController{})
}
