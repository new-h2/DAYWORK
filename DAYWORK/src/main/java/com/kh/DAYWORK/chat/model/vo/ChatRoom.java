package com.kh.DAYWORK.chat.model.vo;

public class ChatRoom {
//	private int cRoomSerialNo;
	private int cRoomNo;
	private int cRoomM;
	private String cRoomP;
	private String cRoomMName;
	private String cRoomPName;
	private String mComma;
	private String pComma;
	private String cRoomProfile;
	
	public ChatRoom() {}
	
	public ChatRoom(int cRoomM, String cRoomP, String cRoomPName) {
		super();
		this.cRoomM = cRoomM;
		this.cRoomP = cRoomP;
		this.cRoomPName = cRoomPName;
	}

	public ChatRoom(int cRoomNo, int cRoomM, String cRoomP, String cRoomMName, String cRoomPName) {
		super();
		this.cRoomNo = cRoomNo;
		this.cRoomM = cRoomM;
		this.cRoomP = cRoomP;
		this.cRoomMName = cRoomMName;
		this.cRoomPName = cRoomPName;
	}

	public int getcRoomNo() {
		return cRoomNo;
	}

	public void setcRoomNo(int cRoomNo) {
		this.cRoomNo = cRoomNo;
	}

	public int getcRoomM() {
		return cRoomM;
	}

	public void setcRoomM(int cRoomM) {
		this.cRoomM = cRoomM;
	}

	public String getcRoomP() {
		return cRoomP;
	}

	public void setcRoomP(String cRoomP) {
		this.cRoomP = cRoomP;
	}

	public String getcRoomMName() {
		return cRoomMName;
	}

	public void setcRoomMName(String cRoomMName) {
		this.cRoomMName = cRoomMName;
	}
	
	public String getcRoomPName() {
		return cRoomPName;
	}

	public void setcRoomPName(String cRoomPName) {
		this.cRoomPName = cRoomPName;
	}

	public String getmComma() {
		return mComma;
	}

	public void setmComma(String mComma) {
		this.mComma = mComma;
	}

	public String getpComma() {
		return pComma;
	}

	public void setpComma(String pComma) {
		this.pComma = pComma;
	}

	public String getcRoomProfile() {
		return cRoomProfile;
	}

	public void setcRoomProfile(String cRoomProfile) {
		this.cRoomProfile = cRoomProfile;
	}

	@Override
	public String toString() {
		return "ChatRoom [cRoomNo=" + cRoomNo + ", cRoomM=" + cRoomM + ", cRoomP=" + cRoomP + ", cRoomMName="
				+ cRoomMName + ", cRoomPName=" + cRoomPName + ", mComma=" + mComma + ", pComma=" + pComma
				+ ", cRoomProfile=" + cRoomProfile + "]";
	}
}
