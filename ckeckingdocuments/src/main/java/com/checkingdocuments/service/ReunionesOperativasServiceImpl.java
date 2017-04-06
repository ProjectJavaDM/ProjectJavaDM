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
	public ReunionesOperativas findById(Integer id) {
		return this.roRepository.findOne(Long.valueOf(id));
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
	public void deleteReunionesOperativasById(Integer id) {
		this.roRepository.delete(Long.valueOf(id));
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
