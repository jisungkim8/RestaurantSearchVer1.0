package restaurant.dto;

import java.sql.Date;//DB자료형

import org.springframework.web.multipart.MultipartFile;
//springboard2테이블->필드와 매핑
public class BoardCommand {

	private int seq;
	private String writer,title,content,pwd;
	private int hit;//조회수
	private Date regdate;//작성날짜
	//업로드->경로,파일명->MultipartFile클래스를 이용
	private MultipartFile upload;
	//-----------------------------------------------------
	private String filename;//업로드할 파일명
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String toString(){
		return "BoardCommand[seq="+seq+",writer="+writer+",title="
				  +title+",content="+content+",pwd="+pwd+",hit="
				  +hit+",regdate="+regdate+",upload="+upload
				  +",filename="+filename+"]";
	}
	
	
}


