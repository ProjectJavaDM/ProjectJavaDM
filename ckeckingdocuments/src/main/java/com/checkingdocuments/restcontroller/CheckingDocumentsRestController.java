package com.checkingdocuments.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.checkingdocuments.model.ReunionesOperativas;
import com.checkingdocuments.service.ReunionesOperativasService;
import com.checkingdocuments.utils.Utils;

@RestController
public class CheckingDocumentsRestController extends Utils{
	
	@Autowired
	private ReunionesOperativasService roService;
	
	@RequestMapping(value = "/ckeckingdocuments/searchMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearchMissing() {
		List<ReunionesOperativas> listRO = this.roService.findAllReunionesOperativas();
		
		if(listRO.isEmpty())
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		
		for(ReunionesOperativas reunionesOperativas: listRO){
			boolean comparacion = findFile(reunionesOperativas.getRuta(), reunionesOperativas.getNombreArchivo(), 
							reunionesOperativas.getPeriocidad());
			reunionesOperativas.setEstado(comparacion? 1: 0);
			this.roService.updateReunionesOperativas(reunionesOperativas);
		}
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	public ReunionesOperativasService getRoService() {
		return roService;
	}
	public void setRoService(ReunionesOperativasService roService) {
		this.roService = roService;
	}
}
