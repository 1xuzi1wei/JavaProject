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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH点mm分ss秒");
		dateTime = sdf.format(currDate);
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getWeek() {
		String[] weeks ={"星期日","星期一","星期二","星期三","星期四","星期五","星期六"};
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

