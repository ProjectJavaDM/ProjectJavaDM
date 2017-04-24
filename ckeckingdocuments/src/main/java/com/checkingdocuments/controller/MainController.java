package com.checkingdocuments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.checkingdocuments.model.ReunionesOperativas;
import com.checkingdocuments.service.ReunionesOperativasService;

@Controller
@RequestMapping
@SessionAttributes({"modelView"})
public class MainController {
	
	@Autowired
	private ReunionesOperativasService roService;
	
	@ModelAttribute("modelView")
	public ReunionesOperativas getInitializedModelView() {
		return new ReunionesOperativas();
	}
	
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
	
	@RequestMapping("/addReunionOperativa")
	public String addReunionOperativa(@ModelAttribute("modelView") ReunionesOperativas modelView, ModelMap model) {
		model.addAttribute("reunionOperativa", modelView);
		return "addReunionOperativa";
	}
	
	@RequestMapping(path = "/addReunionOperativa/{id}", method = RequestMethod.GET)
	public String addReunionOperativa(@PathVariable("id") Long id, @ModelAttribute("modelView") ReunionesOperativas modelView, ModelMap model) {
		ReunionesOperativas reunionesOperativas = this.roService.findById(id);
		copiarReunionOperativa(modelView, reunionesOperativas);
		model.addAttribute("reunionOperativa", modelView);
		return "redirect:/addReunionOperativa";
	}
	
	private void copiarReunionOperativa(ReunionesOperativas modelView, ReunionesOperativas reunionesOperativas){
		modelView.setId(reunionesOperativas.getId());
		modelView.setAplicacion(reunionesOperativas.getAplicacion());
		modelView.setCentro(reunionesOperativas.getCentro());
		modelView.setCliente(reunionesOperativas.getCliente());
		modelView.setComentario(reunionesOperativas.getComentario());
		modelView.setLinea(reunionesOperativas.getLinea());
		modelView.setNombreArchivo(reunionesOperativas.getNombreArchivo());
		modelView.setResponsable(reunionesOperativas.getResponsable());
		modelView.setRuta(reunionesOperativas.getRuta());
	}
	
	public ReunionesOperativasService getRoService() {
		return roService;
	}

	public void setRoService(ReunionesOperativasService roService) {
		this.roService = roService;
	}
}
