package com.iii.eeit9703.club.model;

import java.io.InputStream;
import java.io.Serializable;

public class ClubPhotoVO implements Serializable{
		private Integer photo_no;		
		private String name;
		private String photo;
		private Integer photoId;
		
		
		public Integer getPhotoId() {
			return photoId;
		}
		public void setPhotoId(Integer photoId) {
			this.photoId = photoId;
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
