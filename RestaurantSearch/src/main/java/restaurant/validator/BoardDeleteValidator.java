
package restaurant.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import restaurant.dto.BoardCommand;

//1.validator인터페이스 상속

public class BoardDeleteValidator implements Validator{

	//유효성검사할 클래스 등록
	//@Override
	public boolean supports(Class<?> clazz) {
		return BoardCommand.class.isAssignableFrom(clazz);
	}

	//유효성검사를 할 메서드를 실행->validate()구현
	//ValidationUtils.rejectIfEmptyOrWhitespace->필수입력?
	//@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");
	}
}



