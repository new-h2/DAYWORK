 package com.kh.DAYWORK.member.model.vo;

import java.sql.Date;

public class Member {
	private int mNo;
	private String mPwd;
	private String mName;
	private String mGender;
	private Date mBirthDay;
	private String mPhone;
	private String mEmail;
	private String mAddress;
	private Date mEntDate;
	private Date mHireDate;
	private String mStatus;
	private int mAdmin;
	private String jCode;
	private String jName;
	private String dCode;
	private String dName;
	private String mOriginProfile;
	private String mRenameProfile;

	public Member() {}

	public Member(int mNo, String mPwd, String mName, String mGender, Date mBirthDay, String mPhone, String mEmail,
			String mAddress, Date mEntDate, Date mHireDate, String mStatus, int mAdmin, String jCode, String jName,
			String dCode, String dName, String mOriginProfile, String mRenameProfile) {
		super();
		this.mNo = mNo;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mGender = mGender;
		this.mBirthDay = mBirthDay;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mAddress = mAddress;
		this.mEntDate = mEntDate;
		this.mHireDate = mHireDate;
		this.mStatus = mStatus;
		this.mAdmin = mAdmin;
		this.jCode = jCode;
		this.jName = jName;
		this.dCode = dCode;
		this.dName = dName;
		this.mOriginProfile = mOriginProfile;
		this.mRenameProfile = mRenameProfile;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public Date getmBirthDay() {
		return mBirthDay;
	}

	public void setmBirthDay(Date mBirthDay) {
		this.mBirthDay = mBirthDay;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public Date getmEntDate() {
		return mEntDate;
	}

	public void setmEntDate(Date mEntDate) {
		this.mEntDate = mEntDate;
	}

	public Date getmHireDate() {
		return mHireDate;
	}

	public void setmHireDate(Date mHireDate) {
		this.mHireDate = mHireDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public int getmAdmin() {
		return mAdmin;
	}

	public void setmAdmin(int mAdmin) {
		this.mAdmin = mAdmin;
	}

	public String getjCode() {
		return jCode;
	}

	public void setjCode(String jCode) {
		this.jCode = jCode;
	}

	public String getjName() {
		return jName;
	}

	public void setjName(String jName) {
		this.jName = jName;
	}

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getmOriginProfile() {
		return mOriginProfile;
	}

	public void setmOriginProfile(String mOriginProfile) {
		this.mOriginProfile = mOriginProfile;
	}

	public String getmRenameProfile() {
		return mRenameProfile;
	}

	public void setmRenameProfile(String mRenameProfile) {
		this.mRenameProfile = mRenameProfile;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mPwd=" + mPwd + ", mName=" + mName + ", mGender=" + mGender + ", mBirthDay="
				+ mBirthDay + ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", mAddress=" + mAddress + ", mEntDate="
				+ mEntDate + ", mHireDate=" + mHireDate + ", mStatus=" + mStatus + ", mAdmin=" + mAdmin + ", jCode="
				+ jCode + ", jName=" + jName + ", dCode=" + dCode + ", dName=" + dName + ", mOriginProfile="
				+ mOriginProfile + ", mRenameProfile=" + mRenameProfile + "]";
	}

	
	
}
