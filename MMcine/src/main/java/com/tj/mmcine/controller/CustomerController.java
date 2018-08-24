package com.tj.mmcine.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.mmcine.model.Admin;
import com.tj.mmcine.model.Customer;
import com.tj.mmcine.service.IAdminService;
import com.tj.mmcine.service.ICustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private ICustomerService cusService;
	@Autowired
	private IAdminService adminService;
	
	//사용자로그인
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Customer customer, Model model, HttpSession httpSession) {
		Customer cust = cusService.customerlogin(customer);
		
		if (cust != null) {
			if (cust.getCusBlack() == 0) {
				httpSession.setAttribute("SessionCustomer", cust);
				model.addAttribute("loginMsg", "로그인 성공");
			}else if(cust.getCusBlack() == 1) {
				model.addAttribute("loginMsg", "회원 탈퇴된 회원입니다.");
			}else if(cust.getCusBlack() == 2) {
				model.addAttribute("loginMsg", "블랙회원은 로그인할 수 없습니다.");
			}
		}else {
			model.addAttribute("loginMsg", "없는 회원 이거나 아이디 혹은 비밀번호 오류입니다.");
		}
		return "forward:main.do";
	}
		
	//관리자로그인 창
	@RequestMapping(value="admin_view", method=RequestMethod.GET)
	public String admin_view() {
		
		return "admin/admin_view";
	}
	//(Model을사용할때 무언가를 받아오면 모델객체에 받아온것이 자동으로 셋어트리뷰트된다 )
	//(그렇기때문에 세션 셋어트리뷰트이름과 똑같이 써주면 충돌할수도있다)
	//(여기서는 Admin Dto를 받아온것이 model에도 들어가서 충돌했었다)
	//관리자로그인
	@RequestMapping(value="alogin", method=RequestMethod.POST)
	public String alogin(Admin admin, Model model, HttpSession httpSession) {
		Admin ad = adminService.adminLogin(admin);

		if (ad != null) {
			httpSession.setAttribute("SessionAdmin", ad);
			//loginMsg = "관리자관리자";
			model.addAttribute("loginMsg", "관리자권한으로 로그인 성공");
		}else {
			//loginMsg = "admin login fail";
			model.addAttribute("loginMsg", "관리자로그인 실패 아이디와 비밀번호를 확인하세요.");
		}
		return "forward:main.do";
		//return "redirect:main.do?loginMsg="+loginMsg;
	}
		
	@RequestMapping(value="logout")
	public String logout(HttpSession httpSession) {
		
		httpSession.invalidate();

		return "redirect:main.do";
	} // 로그아웃
	
}
