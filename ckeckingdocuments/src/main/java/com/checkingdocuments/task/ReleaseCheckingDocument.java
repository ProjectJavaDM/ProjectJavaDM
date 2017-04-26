package com.checkingdocuments.task;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.checkingdocuments.model.ReunionesOperativas;
import com.checkingdocuments.service.ReunionesOperativasService;
import com.checkingdocuments.utils.Utils;

@Service
@EnableScheduling
public class ReleaseCheckingDocument extends Utils{
	
	private final Logger log = LoggerFactory.getLogger(ReleaseCheckingDocument.class);
	private static final String INFO = "INFO:";
	
	@Autowired
	private ReunionesOperativasService roService;
	
	@Async
	@Scheduled(cron="0 0 8 * * MON", zone="Europe/Madrid")
	public void searchWeeklytMissing() {
		log.info(INFO,"RestController execute searchWeeklytMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(1));
		this.roService.changeReviewedByPeriocidad(Long.valueOf(3));
		changeDocumentsStatus(listRO);
	}
	
	@Async
	@Scheduled(cron="0 0 8 1/15? * *", zone="Europe/Madrid")
	public void searcBiweeklytMissing() {
		log.info(INFO,"RestController execute searcBiweeklytMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(2));
		this.roService.changeReviewedByPeriocidad(Long.valueOf(3));
		changeDocumentsStatus(listRO);
	}
	
	@Async
	@Scheduled(cron="0 0 8 1 * *", zone="Europe/Madrid")
	public void searchMonthlyMissing() {
		log.info(INFO,"RestController execute searchMonthlyMissing");
		List<ReunionesOperativas> listRO = this.roService.findPeriocidadReunionesOperativas(Long.valueOf(3));
		this.roService.changeReviewedByPeriocidad(Long.valueOf(3));
		changeDocumentsStatus(listRO);
	}
	
	private void changeDocumentsStatus(List<ReunionesOperativas> listRO) {
		if(listRO.isEmpty())
			return ;
		
		for(ReunionesOperativas reunionesOperativas: listRO){
			boolean comparacion = findFile(reunionesOperativas.getRuta(), reunionesOperativas.getNombreArchivo(), 
							reunionesOperativas.getPeriocidad());
			reunionesOperativas.setEstado(comparacion? 1: 0);
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
