package restaurant.util;

//업로드 할때 업로드할 원본파일의 이름을 변경,수정할때 삭제
//하기위해서 필요로하는 유틸리티클래스
import java.io.File;

public class FileUtil {
    //업로드 위치->절대경로(c:\~
  public static final String UPLOAD_PATH="C:/Users/kitcoop/git/RestaurantSearchVer1.0/RestaurantSearch/src/main/webapp/upload";
  
  //1.원본파일의 이름을 변경할 메서드
  //ex) test.txt or test.TXT ->lastIndex(.) ,substring()이용
  public static String rename(String filename) throws Exception {
	  if(filename==null) return null;//업로드를 하지 않은 경우
	  //규칙정해주기->시스템의 날짜+임의의 숫자를 조합해서 새로운 파일생성
	  String newName=Long.toString(System.currentTimeMillis())+
			                     (int)(Math.random()*50); //0~49
	  return rename(filename,newName);
  }
  
  //1.원래의 이름(originalfilenmae) 2.새로 변경한 파일이름 
  //ex) test.txt
  public static String rename(String filename,String newName)
		                                             throws Exception {
	  if (filename==null) return null;
	  //확장자 위치 얻기
	  int idx=filename.lastIndexOf(".");  //못찾으면 -1을 리턴
	  String extention="";//확장자만 따로 저장
	  String newFileName="";//새파일명을 저장할 변수
	  if(idx!=-1){
		  extention=filename.substring(idx);
		  System.out.println("extention="+extention);
	  }
	  //넘어온 파일명->확장자가 들어가 있는 경우(ex  test.TXT->test.txt)
	   int newIdx=newName.lastIndexOf(".");
	   if(newIdx!=-1){  //takdadkdkadka.txt
		   newName=newName.substring(0,newIdx);
		   //문자열의 0번째부터 nexIdx의 번호 앞번호까지의 문자열
	   }
	   newFileName=newName+extention.toLowerCase();//확장자가 대문자->소문자
	   return newFileName;
	  
  }
  
  //2.파일 삭제->파일의 정보(위치)->delete()
  public static void removeFile(String filename){
	  File file=new File(UPLOAD_PATH,filename);//파일의 경로,파일명
	  if (file.exists()) file.delete(); //존재하면 삭제하라
  } 
}





