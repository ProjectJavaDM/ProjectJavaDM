package com.ckeckingdocuments.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ckeckingdocuments.model.ReunionesOperativas;
import com.ckeckingdocuments.service.ReunionesOperativasService;

@RestController
public class CheckingDocumentsRestController {
	
	@Autowired
	private ReunionesOperativasService roService;
	
	@RequestMapping(value = "/reunionesOperativas/", method = RequestMethod.GET)
	public ResponseEntity<List<ReunionesOperativas>> listAllReunionesOperativas() {
		List<ReunionesOperativas> roList = this.roService.findAllReunionesOperativas();
		if(roList.isEmpty())
			return new ResponseEntity<List<ReunionesOperativas>>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<ReunionesOperativas>>(roList,HttpStatus.NO_CONTENT);
	}
	
	public ReunionesOperativasService getRoService() {
		return roService;
	}
	public void setRoService(ReunionesOperativasService roService) {
		this.roService = roService;
	}
}
