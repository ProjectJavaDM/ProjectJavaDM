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
	
	@RequestMapping(value = "/ckeckingdocuments/searchAllMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearchAlltMissing() {
		log.info(INFO,"RestController execute getSearchAlltMissing");
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
	
	@RequestMapping(value = "/ckeckingdocuments/searchWeeklyMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearchWeeklytMissing() {
		log.info(INFO,"RestController execute getSearchWeeklytMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(1));
		
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
	
	@RequestMapping(value = "/ckeckingdocuments/searchBiweeklyMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearcBiweeklytMissing() {
		log.info(INFO,"RestController execute getSearcBiweeklytMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(2));
		
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
	
	@RequestMapping(value = "/ckeckingdocuments/searchMonthlyMissing", method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> getSearchMonthlyMissing() {
		log.info(INFO,"RestController execute getSearchMonthlyMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(3));
		
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
