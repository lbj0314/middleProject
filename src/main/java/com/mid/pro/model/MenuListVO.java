package com.mid.pro.model;

import org.springframework.web.multipart.MultipartFile;

public class MenuListVO {
	
	private String [] menu_name;
	private String [] menu_contents;
	private int[] price;
	private String[] origin;
	private MultipartFile[] file;
	
	
	
	public String[] getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String[] menu_name) {
		this.menu_name = menu_name;
	}
	public String[] getMenu_contents() {
		return menu_contents;
	}
	public void setMenu_contents(String[] menu_contents) {
		this.menu_contents = menu_contents;
	}
	public int[] getPrice() {
		return price;
	}
	public void setPrice(int[] price) {
		this.price = price;
	}
	public String[] getOrigin() {
		return origin;
	}
	public void setOrigin(String[] origin) {
		this.origin = origin;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

	
	
	
	
}
