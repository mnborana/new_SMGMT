package com.servletStore.settings.standard.model;

public class StandardPOJO {

		private int id, stdId, schoolSectionId, schoolId, sectionId, fkClassId;
		private String schoolName, sectionName, stdName;
		
		public int getFkClassId() {
			return fkClassId;
		}
		public void setFkClassId(int fkClassId) {
			this.fkClassId = fkClassId;
		}
		public String getStdName() {
			return stdName;
		}
		public void setStdName(String stdName) {
			this.stdName = stdName;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		
		public int getStdId() {
			return stdId;
		}
		public void setStdId(int stdId) {
			this.stdId = stdId;
		}
		public int getSchoolSectionId() {
			return schoolSectionId;
		}
		public void setSchoolSectionId(int schoolSectionId) {
			this.schoolSectionId = schoolSectionId;
		}
		public int getSchoolId() {
			return schoolId;
		}
		public void setSchoolId(int schoolId) {
			this.schoolId = schoolId;
		}
		public int getSectionId() {
			return sectionId;
		}
		public void setSectionId(int sectionId) {
			this.sectionId = sectionId;
		}
		
		
		public String getSchoolName() {
			return schoolName;
		}
		public void setSchoolName(String schoolName) {
			this.schoolName = schoolName;
		}
		public String getSectionName() {
			return sectionName;
		}
		public void setSectionName(String sectionName) {
			this.sectionName = sectionName;
		}
		
}
