package com.checkingdocuments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/servicios")
	public String getMainController() {
		return "index";
	}
	
	@RequestMapping("/servicios/serviceRO")
	public String getServiceRO() {
		return "servicios/serviceRO";
	}
	
	@RequestMapping("/servicios/serviceCD")
	public String getServiceCD() {
		return "servicios/serviceCD";
	}
}
