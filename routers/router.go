package routers

import (
	"quickstart/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.LogInController{})
	beego.Router("/home", &controllers.MainController{})
}
