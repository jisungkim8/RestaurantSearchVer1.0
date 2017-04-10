package restaurant.controller;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import restaurant.dao.BoardDao;
import restaurant.dto.BoardCommand;
import restaurant.util.FileUtil;
import restaurant.validator.BoardValidator;

//유효성검사->입력->ok->boardWriter.jsp화면에 출력

@Controller
public class WriteController {

	//디버깅하기위해서 적용객체 생성(로그객체)
	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDao boardDao; //멤버변수위에 @Autowired->Setter X

	
	//형식)@RequstMapping(value="/요청명령어",method=RequestMethod.GET(Get방식)
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String form(){
		System.out.println("form()메서드 호출됨!");
		return "boardWrite"; //return 이동할페이지명;
	}
	
	//에러메세지가 발생이 되었다면 MemberCommand에 값을 저장한 상태->초기화
	//id,passwd,name(X)->가입버튼클릭->이름은 필수입력이다.->id=null,passwd=null
	//public DTO자료형 메서드명(){ return new DTO자료형();
	//@ModelAttribute->이 붙은 메서드->잘못입력시  초기화시켜주는 메서드호출
	//형식)@ModelAttribute("웹과 연결시킬(binding) 키워드")
	
	@ModelAttribute("command")
	public BoardCommand formBacking(){
		System.out.println("formBacking()메서드 호출됨!");
		return new BoardCommand(); //객체명X
	}
	
	//입력을 다하고나서 글쓰기 전송버튼 눌렀다면(에러메세지(유효성검사)
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardCommand command,BindingResult result){
		if(log.isDebugEnabled()){
			log.debug("BoardCommand="+command);//toString()
		}
		//유효성 검사->에러발생->에레메세지를 불러오게 설정
		new BoardValidator().validate(command, result);
		//만약에 에러가 발생이 되었다면
		if(result.hasErrors()){
			return form();//form()호출
		}
		
		try{
		    String newName="";//변경할 파일이름
		    //업로드된 파일이 존재한다면
		    if(!command.getUpload().isEmpty()){
		    	newName=FileUtil.rename
		    			(command.getUpload().getOriginalFilename());
		    	System.out.println("원본파일명="+
		    			                   command.getUpload().getOriginalFilename());
		    	//DTO의 객체 filename->바뀐파일명-->실제로 DB상의 filename
		    	System.out.println("newName="+newName);
		    	command.setFilename(newName);
		    }
		    //최대값+1
		    int newSeq=boardDao.getNewSeq()+1;
		    command.setSeq(newSeq);//게시물은 로직으로 저장
		    //DB저장->
		    boardDao.insert(command);//입력받은값+게시물번호,파일변경
		    //업로드->업로드된 변경된파일->지정한 업로드위치로 복사해서 이동
		    if(!command.getUpload().isEmpty()){
		    	File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
		    	command.getUpload().transferTo(file);//~transferTo(전송할객체명)
		    }
		
		}catch(IOException e){ //시큐어코딩방식
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/list.do"; //ListController->boardList.jsp로 이동
	}
}




