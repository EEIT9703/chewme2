package com.iii.eeit9703.adphoto.model;

import java.io.InputStream;
import java.io.Serializable;

public class PhotoVO implements Serializable{
		private Integer photo_no;		
		private String name;
		private byte[] photo;
		
		
		
		public Integer getPhoto_no() {
			return photo_no;
		}
		public void setPhoto_no(Integer photo_no) {
			this.photo_no = photo_no;
		}
				
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public byte[] getPhoto() {
			return photo;
		}
		public void setPhoto(byte[] photo) {
			this.photo = photo;
		}
		
}
