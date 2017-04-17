package restaurant.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//뷰를 작성->AbstractView를 상속받아야 뷰가 된다.
public class DownloadView extends AbstractView {

	public DownloadView() {
		setContentType("application/download);charset=utf-8");
	}
	// DetailController에서 전달해주는 모델값을 처리해주는 메소드
	// 1.뷰에게 전달되는 Map객체(Model객체) 2.request 3.response객체

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		File file = (File) model.get("downloadFile");
		// 클라이언트가 받을 수 있도록 환경설정
		response.setContentType(getContentType());// 다운로드 화면
		response.setContentLength((int) file.length());// 다운로드 받은 파일의 길이
		// 브라우저의 종류 한글처리
		String userAgent = request.getHeader("User-Agent");// 브라우저 정보
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String filename = null;// 다운로드 받을 파일명
		// IE라면
		if (ie) {
			filename = URLEncoder.encode(file.getName(), "utf-8");
		} else {// chrom,,, (영어->Iso-8859-1
			filename = new String(file.getName().getBytes("utf-8"), "iso-8859-1");

		}
		// 대화상자(위치경로, 파일명)
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");// 이진파일
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);// 위치/파일정보
			// 파일전송->복사->FileCopyUtil이용
			FileCopyUtils.copy(fis, out);// 입력받는쪽,출력하는쪽
		} catch (IOException e) {
			e.printStackTrace();
		} finally { // 메모리를 해제하는 코딩
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		out.flush();// 출력하라(flush()->무조건 출력)

	}

}
