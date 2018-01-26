package com.mr.idcard;

import com.mr.people.People;

public class IDcard {
	private Integer id;
	private String idcard_code;
	private People people;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIdcard_code() {
		return idcard_code;
	}
	public void setIdcard_code(String idcard_code) {
		this.idcard_code = idcard_code;
	}
	public People getPeople() {
		return people;
	}
	public void setPeople(People people) {
		this.people = people;
	}
}
