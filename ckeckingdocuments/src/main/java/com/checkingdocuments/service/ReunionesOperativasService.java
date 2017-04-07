package com.checkingdocuments.service;

import java.util.List;

import com.checkingdocuments.model.ReunionesOperativas;

public interface ReunionesOperativasService {
	
	public ReunionesOperativas findById(Long id);
	public List<ReunionesOperativas> findByResponsable(String name);
	public void saveReunionesOperativas(ReunionesOperativas reunionesOperativas);
	public void updateReunionesOperativas(ReunionesOperativas reunionesOperativas);
	public void deleteReunionesOperativasById(Long id);
	public List<ReunionesOperativas> findPeriocidadReunionesOperativas(Long periocidad);
	public List<ReunionesOperativas> findAllReunionesOperativas();
	
}
