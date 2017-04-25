package com.checkingdocuments.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.checkingdocuments.model.ReunionesOperativas;

public interface ReunionesOperativasRepository extends CrudRepository<ReunionesOperativas, Long>{
	
	@Query("SELECT ro FROM ReunionesOperativas ro "
			+ "WHERE ro.responsable LIKE LOWER(CONCAT('%', :name, '%'))")
	public List<ReunionesOperativas> findByResponsable(@Param("name") String name);
	
	@Query("SELECT ro FROM ReunionesOperativas ro "
			+ "WHERE ro.periocidad = :periocidad "
			+ "AND ro.estado = 0")
	public List<ReunionesOperativas> findByPeriocidad(@Param("periocidad") Long periocidad);
	
	@Query("SELECT ro FROM ReunionesOperativas ro "
			+ "WHERE ro.periocidad = :periocidad ")
	public List<ReunionesOperativas> findAllByPeriocidad(@Param("periocidad") Long periocidad);
	
	@Modifying
	@Transactional
	@Query("UPDATE ReunionesOperativas ro "
			+ "SET ro.revisado = 0 "
			+ "WHERE ro.periocidad = :periocidad")
	public void  changeReviewedByPeriocidad(@Param("periocidad") Long periocidad);
}
