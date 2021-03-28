package com.web.undefined.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="investment_records", schema ="public")
public class Investment {
	@Id
	@Column(name="id")
	private int id;
	
//	@Column(name="mem_id")
//	private String mem_id;
	
	@Column(name="given_amt")
	private int given_amt;
	
	@ManyToOne
	@JoinColumn(name="mem_id")
	private Member member;

	
	
	
	public Investment(int given_amt) {
		this.given_amt = given_amt;
	}


	public Investment(int given_amt, Member member) {
		this.given_amt = given_amt;
		this.member = member;
	}


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


	public Investment() {
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getGiven_amt() {
		return given_amt;
	}


	public void setGiven_amt(int given_amt) {
		this.given_amt = given_amt;
	}
	
	
	

}
