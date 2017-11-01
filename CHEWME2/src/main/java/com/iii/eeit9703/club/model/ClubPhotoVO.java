package com.iii.eeit9703.club.model;

import java.io.InputStream;
import java.io.Serializable;

public class ClubPhotoVO implements Serializable{
		private Integer photoId;		
		private String name;
		private InputStream photo;
		private Integer clubId;
		
		
		public Integer getPhotoId() {
			return photoId;
		}
		public void setPhotoId(Integer photoId) {
			this.photoId = photoId;
		}

				
		public Integer getClubId() {
			return clubId;
		}
		public void setClubId(Integer clubId) {
			this.clubId = clubId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public InputStream getPhoto() {
			return photo;
		}
		public void setPhoto(InputStream photo) {
			this.photo = photo;
		}
		
}
