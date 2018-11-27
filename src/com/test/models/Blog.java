package com.test.models;

import java.sql.Blob;

public class Blog {
private int b_id;
private int id;
private String author;
private String title;
private String body;
private String location;
private Blob bimage;
private String date;


public Blob getBimage() {
	return bimage;
}
public void setBimage(Blob bimage) {
	this.bimage = bimage;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getB_id() {
	return b_id;
}
public void setB_id(int b_id) {
	this.b_id = b_id;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getBody() {
	return body;
}
public void setBody(String body) {
	this.body = body;
}

public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}


}
