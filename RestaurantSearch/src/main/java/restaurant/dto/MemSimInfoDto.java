package restaurant.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MemSimInfoDto {
	int loginCnt;
	int accuPoint;
	int currPoint;
	String memberGrade;
	String memberId;
	String password;
	String lastLoginTime;
	Date registerDate;


	public int getLoginCnt() {
		return loginCnt;
	}

	public void setLoginCnt(int loginCnt) {
		this.loginCnt = loginCnt;
	}

	public int getAccuPoint() {
		return accuPoint;
	}

	public void setAccuPoint(int accuPoint) {
		this.accuPoint = accuPoint;
	}

	public int getCurrPoint() {
		return currPoint;
	}

	public void setCurrPoint(int currPoint) {
		this.currPoint = currPoint;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "MemSimInfoDto[lonigCnt="+loginCnt+",accuPoint="+accuPoint+",currPoint="+
		currPoint+",memberGrade="+memberGrade+",memberId="+memberId+",password="+password+
		"lastLoginTime="+lastLoginTime+"registerDate="+registerDate+"]";
	}

}
