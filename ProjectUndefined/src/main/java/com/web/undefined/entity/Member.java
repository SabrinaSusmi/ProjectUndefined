package com.web.undefined.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="member", schema ="public")
public class Member {
	
	@Id
	@Column(name="id")
	private String id;
	
	@NotEmpty
	@Column(name="name")
	private String name;
	
	@NotEmpty
	@Column(name="username")
	private String username;
	
	@NotEmpty
	@Size(min=5)
	@Column(name="password")
	private String password;
	
	@NotEmpty
	@Column(name="phone")
	private String phone;
	
	@NotEmpty
	@Column(name="address")
	private String address;
	
	@OneToMany(mappedBy="member",cascade=CascadeType.ALL)
	private List<Investment> investments;

	public Member(String name, String username, String password, String phone, String address) {
		this.name = name;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.address = address;
	}

	public Member() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Investment> getInvestments() {
		return investments;
	}

	public void setInvestments(List<Investment> investments) {
		this.investments = investments;
	}
	
	
}