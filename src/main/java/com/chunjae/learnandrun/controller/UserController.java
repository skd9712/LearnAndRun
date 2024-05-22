package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.MakePage;
import com.chunjae.learnandrun.dto.UserDTO;
import com.chunjae.learnandrun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    private final UserService userService;
    // 암호화
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserController(UserService userService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    // 회원가입
    @GetMapping("/user_join")
    public String join() {
        return "user/user_join";
    }

    @PostMapping("/joinresult")
    public String joinresult(@RequestParam String roadAddress
            , @RequestParam String extraAddress
            , @RequestParam String detailAddress, UserDTO dto) {
        String pwd = "";
        String encodePwd = "";
        pwd = dto.getPassword();
        encodePwd = bCryptPasswordEncoder.encode(pwd);
        dto.setPassword(encodePwd);
        //주소는 도로명주소 + 상세주소 + 세부주소
        String fullAddr = roadAddress + " " + extraAddress + " " + detailAddress;
        dto.setAddr(fullAddr);
        userService.insertUser(dto);
        return "redirect:/user_login";
    }

    // 로그인
    @GetMapping("/user_login")
    public String login(Model model) {
        model.addAttribute("contentpage", "login");
        return "user/user_login";
    }

    @PostMapping("/loginresult")
    public String loginresult(HttpSession session, UserDTO dto, RedirectAttributes redirect) {
        String pwd = "";
        String encodePwd = "";
        UserDTO user = userService.loginUser(dto);
        if (user != null) {
            pwd = dto.getPassword();
            encodePwd = user.getPassword();
            // BCryptPasswordEncoder를 사용하여 입력된 비밀번호와 저장된 비밀번호가 일치하는지 확인
            if (bCryptPasswordEncoder.matches(pwd, encodePwd)) {
                user.setPassword("");
                session.setAttribute("dto", user);
                return "redirect:/index";
            } else {
                // 비밀번호가 일치하지 않는 경우 로그인 실패 처리
                int result = 0;
                redirect.addFlashAttribute("result", result);
                return "redirect:/user_login";
            }
        } else {
            // 사용자 정보가 존재하지 않는 경우 로그인 실패 처리
            int result = 0;
            redirect.addFlashAttribute("result", result);
            return "redirect:/user_login";
        }
    }

    // 아이디 중복 검사
    @PostMapping("/checkId")
    @ResponseBody
    public String checkId(@RequestParam("userId") String userId) {
        int result = userService.checkId(userId);
        if (result != 0) {
            return "fail";
        } else {
            return "success";
        }
    }

    @GetMapping("/user_logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("dto") != null) {
            session.invalidate();
        }
        return "redirect:/index";
    }

    //마이페이지
    @GetMapping("/user_mypage")
    public String mypage(HttpServletRequest request, Model model, RedirectAttributes redirect) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            UserDTO user = (UserDTO) session.getAttribute("dto");
            if (user != null) {
                model.addAttribute("user", user);
                return "user/user_mypage";
            }
        }
        redirect.addFlashAttribute("message", "로그인필요");
        return "user/user_login";
    }

    //사용자 정보 수정
    @GetMapping("/user_update")
    public String updateUser(HttpSession session, Model model) {

        UserDTO sessionUser = (UserDTO) session.getAttribute("dto");
        if (sessionUser != null) {
            String userId = sessionUser.getUserId();
            UserDTO user = userService.detailUser(userId);
            model.addAttribute("user", user);
        }

        return "user/user_update";
    }

    @PostMapping("/updateresult")
    public String updateUserResult(@ModelAttribute UserDTO dto
            , @RequestParam String roadAddress
            , @RequestParam String extraAddress
            , @RequestParam String detailAddress, HttpSession session) {
        System.out.println("Updating user with data: " + dto);
        String fullAddr = roadAddress + " " + extraAddress + " " + detailAddress;
        dto.setAddr(fullAddr);
        int result = userService.updateUser(dto);
        System.out.println("Update result: " + result);

        if (result > 0) {

            session.setAttribute("user", dto);
            return "user/user_mypage";
        } else {
            return "redirect:/index";
        }
    }

    //관리자 페이지
    @GetMapping("/user_manager")
    public String user_manager(HttpServletRequest request, Model model
            , RedirectAttributes redirect
            , @RequestParam(required = false, defaultValue = "1") String curr
            , @RequestParam(required = false, defaultValue = "") String search
            , @RequestParam(required = false, defaultValue = "") String search_txt) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            UserDTO user = (UserDTO) session.getAttribute("dto");
            if (user != null) {
                // 사용자 아이디가 "admin"인지 확인
                if ("admin".equals(user.getUserId())) {
                    // 관리자 페이지로 이동
                    int currpage = Integer.parseInt(curr);
                    if(curr!=null)
                        currpage = Integer.parseInt(curr);
                    int totalCount = userService.getUserCount(search,search_txt);
                    int pageSize = 12;
                    int blockSize= 5;
                    MakePage page = new MakePage(currpage,totalCount,pageSize,blockSize);
                    List<UserDTO> list = userService.listUser(search, search_txt);
                    model.addAttribute("list", list);
                    model.addAttribute("page",page);
                    model.addAttribute("search", search);
                    model.addAttribute("search_txt", search_txt);
                    return "user/user_manager";
                } else {
                    // 일반 사용자인 경우 사용자 관리 페이지로 이동
                    model.addAttribute("user", user);
                    redirect.addFlashAttribute("message", "관리자만 접속 가능합니다.");
                    return "redirect:/index";
                }
            }
        }
        // 세션이 없거나 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
        redirect.addFlashAttribute("message", "로그인필요");
        return "redirect:/user_login";
    }


}
