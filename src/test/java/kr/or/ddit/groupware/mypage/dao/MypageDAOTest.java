package kr.or.ddit.groupware.mypage.dao;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.groupware.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class MypageDAOTest {

	@Inject
	private MypageDAO dao;
	
	@Test
	void test() {
		List<EmployeeVO> eList= dao.selectMypage("E220321003");
		log.info("여기 : {}",eList);
	}

}
