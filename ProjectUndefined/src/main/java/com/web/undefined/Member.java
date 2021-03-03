package com.web.undefined;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="Member")
public class Member {
	
	@Column(name="ID", unique=true, nullable=false)
	@NotEmpty(message="plz provide your id")
	public String id;
	
	@Column(name="Name")
	@NotEmpty(message="plz provide your name")
	public String name;
	
	@Column(name="Age")
	public int age;

	protected String getId() {
		return id;
	}

	protected void setId(String id) {
		this.id = id;
	}

	protected String getName() {
		return name;
	}

	protected void setName(String name) {
		this.name = name;
	}

	protected int getAge() {
		return age;
	}

	protected void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", age=" + age + "]";
	}
	
	

}
