package com.ckeckingdocuments.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.ckeckingdocuments.model.ReunionesOperativas;

public interface ReunionesOperativasRepository extends CrudRepository<ReunionesOperativas, Long>{
	
	@Query("SELECT ro FROM ReunionesOperativas ro" +
			"WHERE ro.responsable LIKE LOWER(CONCAT('%', :name, '%'));")
	public ReunionesOperativas findByResponsable(@Param("name") String name);
	
	
}
