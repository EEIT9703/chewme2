package com.iii.eeit9703.adphoto.model;

import java.io.InputStream;
import java.io.Serializable;

public class PhotoVO implements Serializable{
		private Integer photo_no;		
		private String name;
		private String photo;
		private Integer status;
		
		
		public Integer getStatus() {
			return status;
		}
		public void setStatus(Integer status) {
			this.status = status;
		}
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
		public String getPhoto() {
			return photo;
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}
		
}
