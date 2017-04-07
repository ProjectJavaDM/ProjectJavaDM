package com.checkingdocuments.task;

import java.util.Date;

import javax.ws.rs.core.UriBuilder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.checkingdocuments.utils.Utils;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;


@Service
@EnableScheduling
public class ReleaseCheckingDocument extends Utils{
	
	private final Logger log = LoggerFactory.getLogger(ReleaseCheckingDocument.class);
	
	@Async
//	@Scheduled(cron=" 0 0 8? * Mon", zone="Europe/Madrid")
	@Scheduled(fixedDelay = 5000)
	public String startAsyncron() {
		String message = "Ejecución del metodo asyncrono cada 5 segundos. Hora " + new Date();
		log.info(message);
		String url = "http://" + urlServerLocal() + "/ckeckingdocuments/searchMissing";
//		callServiceRestCD(url);
		return null;
	}
	
	private void callServiceRestCD(String url){
		try {
			ClientConfig config = new DefaultClientConfig();
			Client client = Client.create(config);
			WebResource webResource = client.resource(UriBuilder.fromUri(url).build());
			webResource.type(MediaType.APPLICATION_JSON_VALUE).post();
		}catch(Exception e){
			log.error("Error: ",e);
		}
	}
}
