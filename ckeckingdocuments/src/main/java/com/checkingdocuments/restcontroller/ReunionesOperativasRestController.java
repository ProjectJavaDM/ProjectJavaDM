package com.checkingdocuments.restcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.checkingdocuments.model.ReunionesOperativas;
import com.checkingdocuments.service.ReunionesOperativasService;

@RestController
public class ReunionesOperativasRestController {
	
	private final Logger log = LoggerFactory.getLogger(ReunionesOperativasRestController.class);
	private static final String INFO = "INFO:";
	
	@Autowired
	private ReunionesOperativasService roService;
	
	@RequestMapping(value = "/reunionesOperativas/", method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReunionesOperativas>> listAllReunionesOperativas() {
		log.info(INFO,"RestController execute listAllReunionesOperativas");
		List<ReunionesOperativas> roList = this.roService.findAllReunionesOperativas();
		if(roList.isEmpty())
			return new ResponseEntity<List<ReunionesOperativas>>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<ReunionesOperativas>>(roList,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/reunionesOperativas/byId/{id}", method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReunionesOperativas> getReunionesOperativasById(@PathVariable("id") Long id) {
		log.info(INFO,"RestController execute getReunionesOperativasById");
		ReunionesOperativas reunionesOperativas = this.roService.findById(id);
		if(reunionesOperativas == null)
			return new ResponseEntity<ReunionesOperativas>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<ReunionesOperativas>(reunionesOperativas,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/reunionesOperativas/byName/{name}", method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReunionesOperativas>> getReunionesOperativasById(@PathVariable("name") String name) {
		log.info(INFO,"RestController execute getReunionesOperativasById");
		List<ReunionesOperativas> roList = this.roService.findByResponsable(name);
		if(roList.isEmpty())
			return new ResponseEntity<List<ReunionesOperativas>>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<ReunionesOperativas>>(roList,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/reunionesOperativas/save", method = RequestMethod.POST)
	public ResponseEntity<Void> saveReunionesOperativas(@RequestBody ReunionesOperativas reunionesOperativas) {
		log.info(INFO,"RestController execute saveReunionesOperativas");
		this.roService.saveReunionesOperativas(reunionesOperativas);
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/reunionesOperativas/update", method = RequestMethod.PUT,
			consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> updateReunionesOperativas(@RequestBody ReunionesOperativas reunionesOperativas,
			UriComponentsBuilder ucBuilder) {
		log.info(INFO,"RestController execute updateReunionesOperativas");
		this.roService.updateReunionesOperativas(reunionesOperativas);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/reunionesOperativas/{id}").buildAndExpand(
				reunionesOperativas.getId()).toUri());
		 
		return new ResponseEntity<Void>(headers,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/reunionesOperativas/{id}", method = RequestMethod.DELETE,
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> deleteReunionesOperativas(@PathVariable("id") Long id) {
		log.info(INFO,"RestController execute deleteReunionesOperativas");
		ReunionesOperativas reunionesOperativas = this.roService.findById(id);
		if(reunionesOperativas == null)
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		this.roService.deleteReunionesOperativasById(id);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	public ReunionesOperativasService getRoService() {
		return roService;
	}
	public void setRoService(ReunionesOperativasService roService) {
		this.roService = roService;
	}
}
