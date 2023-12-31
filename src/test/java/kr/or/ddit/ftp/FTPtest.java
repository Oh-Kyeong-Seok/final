package kr.or.ddit.ftp;

import java.io.File;
import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import kr.or.ddit.groupware.webhard.ftp.FTPControl;
import kr.or.ddit.vo.FTPVO;

class FTPtest {

	@Test
	@Disabled
	void downloadTest() {
		FTPVO fVO = new FTPVO();
		fVO.setLocalFile("C:/Users/PC-09/Downloads/a.txt");
		fVO.setFtpFile("/a.txt");
		FTPControl.ftpFileDownload(fVO);
	}

	@Test
	void readTest() {
		FTPVO fVO = new FTPVO();
		List<String> list= FTPControl.ftpReadFiles(fVO);
		for(String a: list) {
			System.out.println(a);
		}
	}

	@Test
	@Disabled
	void uploadTest() {
		FTPVO fVO = new FTPVO();
		fVO.setLocalFile("D:/a.txt");
		fVO.setFtpFile("/2/a.txt");
		FTPControl.ftpFileUpload(fVO);
	}

	@Test
	@Disabled
	void deleteTest() {
		FTPVO fVO = new FTPVO();
		fVO.setFtpFile("/3");
		FTPControl.ftpFileDelete(fVO);
	}

	@Test
	@Disabled
	void updateForderTest() {
		FTPVO fVO = new FTPVO();
		fVO.setFtpFile("/3");
		FTPControl.ftpForderUpload(fVO);
	}

	@Test
	@Disabled
	void deleteForderTest() {
		FTPVO fVO = new FTPVO();
		fVO.setFtpFile("/1");
		FTPControl.ftpFolderDelete(fVO);
	}

	@Test
	void test() {
//		String a="asd";
//		if(!a.contains(".")) {
//			System.out.println("1");
//		}else {
//			System.out.println("2");
//		}
		File file= new File("D:/ftpLocal/최프 착수발표.txt");
		file.delete();
	}
}
