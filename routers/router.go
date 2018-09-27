package routers

import (
	"quickstart/controllers"

	"github.com/astaxie/beego"
)

func init() {
	//beego.Router("/", &controllers.LogInPage{})
	//beego.Router("/login", &controllers.LogInController{})
	beego.Router("/home", &controllers.MainController{})
	beego.Router("/home/chart/?:name", &controllers.ChartController{})
}
