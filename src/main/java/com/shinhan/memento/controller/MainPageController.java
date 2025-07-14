package com.shinhan.memento.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shinhan.memento.common.response.BaseResponse;
import com.shinhan.memento.common.response.status.BaseExceptionResponseStatus;
import com.shinhan.memento.dto.mainpage.MainPageBannerDTO;
import com.shinhan.memento.model.Member;
import com.shinhan.memento.service.MainPageService;


@RequestMapping("/mainpage")
@Controller
public class MainPageController {

    @Autowired
    private MainPageService mainPageService;
	
    @RequestMapping({"/main1", "/"})
    public String mainPageView(Model model, HttpSession session) {
    	Member loginUser = (Member) session.getAttribute("loginUser");
    	
        if (loginUser != null) {
            model.addAttribute("loginId", loginUser.getMemberId());
        }
    	
        Map<String, Integer> counts = mainPageService.getMainPageCounts();
        model.addAttribute("counts", counts);
        
        List<MainPageBannerDTO> bannerList = mainPageService.getRecentBanners();
        model.addAttribute("bannerList", bannerList);
        
        return "mainpage/mainpage";
    }
	
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        
        return "redirect:/mainpage/";
    }
    
	@RequestMapping("/404error")
	public String error404() {
		return "mainpage/404error";
	}
	
	@RequestMapping("/500error")
	public String error500() {
	    return "mainpage/500error";
	}
	
	@RequestMapping("/already")
	public String already() {
		return "mainpage/already";
	}
	
	@RequestMapping("/payment")
	public String payment() {
		return "mainpage/payment";
	}

	@RequestMapping("/bye_modal")
	public String bye_modal() {
		return "mainpage/bye_modal";
	}
	
}
