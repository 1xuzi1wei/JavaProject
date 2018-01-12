package com.jyq.bean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateBean {

	public DateBean() {
		// TODO Auto-generated constructor stub
	}
	public String getDateTime() {
		Date currDate = calendar.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� HH��mm��ss��");
		dateTime = sdf.format(currDate);
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getWeek() {
		String[] weeks ={"������","����һ","���ڶ�","������","������","������","������"};
		int index = calendar.get(Calendar.DAY_OF_WEEK);
		week = weeks[index-1];
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	private String dateTime;
	private String week;
	private Calendar calendar = Calendar.getInstance();
	}

