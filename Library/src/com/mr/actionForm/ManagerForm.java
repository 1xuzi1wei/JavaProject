package com.mr.actionForm;

public class ManagerForm {
	private Integer id = 0;
	private String name = "";
	private String pwd = "";
	private int sysset = 0;
	private int readerset = 0;
	private int bookset = 0;
	private int borrowback = 0;
	private int sysquery = 0;
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getSysset() {
		return sysset;
	}
	public void setSysset(int sysset) {
		this.sysset = sysset;
	}
	public int getReaderset() {
		return readerset;
	}
	public void setReaderset(int readerset) {
		this.readerset = readerset;
	}
	public int getBookset() {
		return bookset;
	}
	public void setBookset(int bookset) {
		this.bookset = bookset;
	}
	public int getBorrowback() {
		return borrowback;
	}
	public void setBorrowback(int borrowback) {
		this.borrowback = borrowback;
	}
	public int getSysquery() {
		return sysquery;
	}
	public void setSysquery(int sysquery) {
		this.sysquery = sysquery;
	}

}
