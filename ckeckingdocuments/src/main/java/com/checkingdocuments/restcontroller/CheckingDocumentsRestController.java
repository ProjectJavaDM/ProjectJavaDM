package com.checkingdocuments.restcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private final Logger log = LoggerFactory.getLogger(CheckingDocumentsRestController.class);
	private static final String INFO = "INFO:";
	
	@Autowired
	private ReunionesOperativasService roService;
	
	@RequestMapping(value = "/ckeckingdocuments/searchWeeklyMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearchWeeklytMissing() {
		log.info(INFO,"RestController execute getSearchWeeklytMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(1));
		
		this.roService.changeReviewedByPeriocidad(Long.valueOf(1));
		changeDocumentsStatus(listRO);
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ckeckingdocuments/searchBiweeklyMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearcBiweeklytMissing() {
		log.info(INFO,"RestController execute getSearcBiweeklytMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(2));
		
		this.roService.changeReviewedByPeriocidad(Long.valueOf(2));
		changeDocumentsStatus(listRO);
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ckeckingdocuments/searchMonthlyMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearchMonthlyMissing() {
		log.info(INFO,"RestController execute getSearchMonthlyMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(3));
		
		this.roService.changeReviewedByPeriocidad(Long.valueOf(3));
		changeDocumentsStatus(listRO);
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private void changeDocumentsStatus(List<ReunionesOperativas> listRO) {
		if(listRO.isEmpty())
			return ;
		
		for(ReunionesOperativas reunionesOperativas: listRO){
			boolean comparacion = findFile(reunionesOperativas.getRuta(), reunionesOperativas.getNombreArchivo(), 
					reunionesOperativas.getPeriocidad());
			reunionesOperativas.setEstado(comparacion? 1: 0);
			reunionesOperativas.setRevisado(Long.valueOf(1));
			this.roService.updateReunionesOperativas(reunionesOperativas);
		}
	}
	
	public ReunionesOperativasService getRoService() {
		return roService;
	}
	public void setRoService(ReunionesOperativasService roService) {
		this.roService = roService;
	}
}
