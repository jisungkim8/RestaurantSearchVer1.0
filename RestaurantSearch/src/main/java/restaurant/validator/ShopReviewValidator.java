package restaurant.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import restaurant.dto.ShopReviewDto;

//import dr.mini.domain.MemberCommand;

//웹상에서 유효성검사를 하고자할때 반드시 Validator인터페이스를 상속
public class ShopReviewValidator implements Validator {

	//1.검사대상의 객체->MemberCommand클래스 또는 하위클래스인지를 검사
   public boolean supports(Class<?> clazz) {
	// TODO Auto-generated method stub
	return ShopReviewDto.class.isAssignableFrom(clazz);
  }
	//2.유효성 검사를 체크해주는 메서드호출
	//1)target객체->입력받은값(검증의 대상)->BoardCommand의 객체
	//2)입력받은 값(target)조사->문제가 발생->에러정보를 저장할 객체를 지정
	
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "required");
	}
}



