package com.checkingdocuments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.checkingdocuments.model.ReunionesOperativas;
import com.checkingdocuments.repository.ReunionesOperativasRepository;

@Service
public class ReunionesOperativasServiceImpl implements ReunionesOperativasService{
	
	@Autowired
	private ReunionesOperativasRepository roRepository;
	
	@Override
	public ReunionesOperativas findById(Long id) {
		return this.roRepository.findOne(id);
	}

	@Override
	public List<ReunionesOperativas> findByResponsable(String name) {
		return this.roRepository.findByResponsable(name);
	}

	@Override
	public void saveReunionesOperativas(ReunionesOperativas reunionesOperativas) {
		this.roRepository.save(reunionesOperativas);
	}

	@Override
	public void updateReunionesOperativas(ReunionesOperativas reunionesOperativas) {
		this.roRepository.save(reunionesOperativas);
	}

	@Override
	public void deleteReunionesOperativasById(Long id) {
		this.roRepository.delete(id);
	}
	
	@Override
	public List<ReunionesOperativas> findPeriocidadReunionesOperativas(Long periocidad) {
		return this.roRepository.findByPeriocidad(periocidad);
	}
	
	@Override
	public List<ReunionesOperativas> findAllPeriocidadReunionesOperativas(Long periocidad) {
		return this.roRepository.findAllByPeriocidad(periocidad);
	}
	
	@Override
	public List<ReunionesOperativas> findAllReunionesOperativas() {
		return (List<ReunionesOperativas>) this.roRepository.findAll();
	}

	public ReunionesOperativasRepository getRoRepository() {
		return roRepository;
	}
	public void setRoRepository(ReunionesOperativasRepository roRepository) {
		this.roRepository = roRepository;
	}
}
