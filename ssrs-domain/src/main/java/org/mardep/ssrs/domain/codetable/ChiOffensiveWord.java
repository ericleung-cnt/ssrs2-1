package org.mardep.ssrs.domain.codetable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.mardep.ssrs.domain.AbstractPersistentEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Entity
@Table(name="CHN_OFFENSIVE_WORDS")
public class ChiOffensiveWord extends AbstractPersistentEntity<String> {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Setter
	@Column(name = "COW_WORD", nullable=false, length=30)
	private String id;

	@Getter
	@Setter
	@Column(name = "COW_REMARK", length=30)
	private String remark; 
	

	@Override
	public String getId() {
		return id;
	}

}
