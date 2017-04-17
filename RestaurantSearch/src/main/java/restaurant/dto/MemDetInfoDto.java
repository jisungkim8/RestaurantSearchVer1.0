package restaurant.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemDetInfoDto {
	String memberId;
	String birthDate;
	String gender;
	String phoneNum;
	String emailCheck;
	String selfIntro;
	String photoPath;
	String memberType;
	String interestFood;
	String nickname;
	// 업로드->경로,파일명->MultipartFile 클래스를 이용
	private MultipartFile upload;

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public String getSelfIntro() {
		return selfIntro;
	}

	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getInterestFood() {
		return interestFood;
	}

	public void setInterestFood(String interestFood) {
		this.interestFood = interestFood;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "MemDetInfoDto[memberId=" + memberId + ", birthDate=" + birthDate + ", gender=" + gender + ",phoneNum="
				+ phoneNum + ",emailCheck=" + emailCheck + " ,selfIntro=" + selfIntro + ", photoPath=" + photoPath
				+ ", memberType=" + memberType + ",upload=  "+upload+" interestFood=" + interestFood + ", nickname=" + nickname + "]";
	}

}
