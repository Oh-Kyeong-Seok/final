package kr.or.ddit.groupware.attendance;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.groupware.attendance.dao.AttendanceDAO;
import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.groupware.AttendanceVO;
import kr.or.ddit.vo.groupware.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class AttendanceDAOtest {

	@Inject
	AttendanceDAO dao;
	
	@Test
	void listTest() {
		List empList= dao.attendanceList(null);
		log.info("{}",empList);
	}
	
	@Test
	void insertTest() {
		PaginationInfo<AttendanceVO> paging=new PaginationInfo<AttendanceVO>();
		dao.attendanceList(paging);
		log.info("{}",paging);
	}

}
