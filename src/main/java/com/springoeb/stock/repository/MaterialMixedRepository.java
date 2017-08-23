package com.springoeb.stock.repository;

import com.springoeb.stock.model.MaterialMixed;
import com.springoeb.stock.model_key.MaterialMixedId;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MaterialMixedRepository extends CrudRepository<MaterialMixed,MaterialMixedId>{
}
