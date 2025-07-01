package com.shinhan.memento.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.memento.common.exception.MemberException;
import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.MypageKeepgoingHistoryDTO;
import com.shinhan.memento.model.BaseStatus;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.model.UserType;
import com.shinhan.memento.service.MemberKeepgoingService;
import com.shinhan.memento.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	MemberKeepgoingService memberKeepgoingService;

	@Autowired
	MemberService memberService;

	@RequestMapping("/page1")
	public String myPageView1(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/dash-board/dashboard"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page1");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page2")
	public String myPageView2(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/profile/profile"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page2");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page3")
	public String myPageView3(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/pay/pay"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page3");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page4")
	public String myPageView4(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/pay/paydetail"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page4");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page5")
	public String myPageView5(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/pay/payback"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page5");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page6")
	public String myPageView6(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/dash-board/matchuplist"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page6");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page7")
	public String myPageView7(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/dash-board/mentoslist"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page7");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping("/page8")
	public String myPageView8(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/dash-board/keepgoinglist"; // 화면 컨텐츠만 반환
		} else {
			request.setAttribute("initialPage", "/memento/mypage/page8");
			return "mypage/mypage-main"; // 전체 레이아웃 반환 (screen + sidebar + header 포함)
		}
	}

	@RequestMapping({ "", "/", "/{section}", "/{section}/{sub}" })
	public String mypageEntry() {
		return "mypage/mypage-main";

	}

	@RequestMapping("/dashBoard")
	public String dashBoard(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/dash-board/dashBoard"; // ✨ screen 전용 뷰
		} else {
			request.setAttribute("initialPage", "/memento/mypage/dashBoard"); // 실제 경로 지정
			return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		}
	}

	@RequestMapping("/dashBoard/calender")
	public String calender(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/dash-board/attendance-calender"; // ✨ screen 전용 뷰
		} else {
			request.setAttribute("initialPage", "/memento/mypage/dashBoard/calender"); // 실제 경로 지정
			return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		}
	}

	@RequestMapping("/cash-recharge")
	public String cashRecharge(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/cash-recharge/cash-recharge-main"; // ✨ screen 전용 뷰
		} else {
			request.setAttribute("initialPage", "/memento/mypage/cash-recharge"); // 실제 경로 지정
			return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		}
	}

	@RequestMapping("/spark-test")
	public String sparkTest(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/spark-test/spark-test-main"; // ✨ screen 전용 뷰
		} else {
			request.setAttribute("initialPage", "/memento/mypage/spark-test"); // 실제 경로 지정
			return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		}
	}

	@RequestMapping("/mento-test")
	public String metnoTest(HttpServletRequest request) {
		boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		if (isAjax) {
			return "mypage/mento-test/mento-test-main"; // ✨ screen 전용 뷰
		} else {
			request.setAttribute("initialPage", "/memento/mypage/mento-test"); // 실제 경로 지정
			return "mypage/mypage-main"; // 전체 레이아웃에서 내부에서 AJAX 호출
		}
	}

	/**
	 * 마이페이지(킵고잉 이용내역 조회)
	 */
	@GetMapping("/history/keepgoing")
	public BaseResponse<List<MypageKeepgoingHistoryDTO>> showKeepgoingHistoryByMemberId(@RequestParam int memberId) {
		log.info("[MypageController.showKeepgoingHistory]");
		// mentoId 로 들어온 식별자값이 db에서 유효한 사용자인지 검증
		Map<String, Object> memberCheckParams = new HashMap<>();
		memberCheckParams.put("memberId", memberId);
		memberCheckParams.put("userType", String.valueOf(UserType.MENTO));
		memberCheckParams.put("status", String.valueOf(BaseStatus.ACTIVE));
		Member member = memberService.findMemberById(memberCheckParams);
		if (member == null) {
			throw new MemberException(BaseExceptionResponseStatus.CANNOT_FOUND_MEMBER);
		}
		return new BaseResponse<>(memberKeepgoingService.showKeepgoingHistoryByMemberId(memberId));
	}
}
