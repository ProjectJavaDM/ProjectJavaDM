package com.checkingdocuments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.checkingdocuments.model.ReunionesOperativas;

@Controller
@RequestMapping
@SessionAttributes({"modelView"})
public class MainController {
	
	@ModelAttribute("modelView")
	public ReunionesOperativas getInitializedModelView() {
		return new ReunionesOperativas();
	}
	
	@RequestMapping()
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
