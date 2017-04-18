package com.checkingdocuments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainController {
	
	 
	@RequestMapping
	public String getMainController() {
		return "index";
	}
	
	@RequestMapping("/serviceRO")
	public String getServiceRO() {
		return "servicios/serviceRO";
	}
	
	@RequestMapping("/serviceCD")
	public String getServiceCD() {
		return "servicios/serviceCD";
	}
}
