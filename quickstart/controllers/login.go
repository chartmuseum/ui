package controllers

import (
	"github.com/astaxie/beego"
)

type LogInController struct {
	beego.Controller
}

func (c *LogInController) Get() {
	c.TplName = "login.tpl"
}
