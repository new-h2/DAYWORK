package com.kh.DAYWORK.address.model.vo;

public class Address {
	private int aNo;
	private String name;
	private String comName;
	private String comPhone;
	private String comAddress;
	private String dept;
	private String job;
	private String email;
	private String address;
	private String phone;
	private String memo;
	private String status;
	private String originalFileName;
	private String renameFileName;
	private int mNo;
	
	public Address() {}

	public Address(int aNo, String name, String comName, String comPhone, String comAddress, String dept, String job,
			String email, String address, String phone, String memo, String status, String originalFileName,
			String renameFileName, int mNo) {
		super();
		this.aNo = aNo;
		this.name = name;
		this.comName = comName;
		this.comPhone = comPhone;
		this.comAddress = comAddress;
		this.dept = dept;
		this.job = job;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.memo = memo;
		this.status = status;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.mNo = mNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getComPhone() {
		return comPhone;
	}

	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}

	public String getComAddress() {
		return comAddress;
	}

	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Address [aNo=" + aNo + ", name=" + name + ", comName=" + comName + ", comPhone=" + comPhone
				+ ", comAddress=" + comAddress + ", dept=" + dept + ", job=" + job + ", email=" + email + ", address="
				+ address + ", phone=" + phone + ", memo=" + memo + ", status=" + status + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", mNo=" + mNo + "]";
	}
	
}
