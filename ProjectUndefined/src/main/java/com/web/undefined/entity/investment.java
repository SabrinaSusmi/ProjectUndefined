package com.web.undefined.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="investment_records", schema ="public")
public class investment {
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="mem_id")
	private String mem_id;
	
	@Column(name="given_amt")
	private int given_amt;

	public investment(String mem_id, int given_amt) {
		this.mem_id = mem_id;
		this.given_amt = given_amt;
	}
	
	
	public investment() {
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public int getGiven_amt() {
		return given_amt;
	}


	public void setGiven_amt(int given_amt) {
		this.given_amt = given_amt;
	}
	
	
	

}
