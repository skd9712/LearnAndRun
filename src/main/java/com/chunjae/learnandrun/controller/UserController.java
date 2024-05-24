package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.*;
import com.chunjae.learnandrun.service.LectureService;
import com.chunjae.learnandrun.service.OrderService;
import com.chunjae.learnandrun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    private final UserService userService;

    private final LectureService service;

    private final OrderService orderService;
    // 암호화
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserController(UserService userService, LectureService service, OrderService orderService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.service = service;
        this.orderService = orderService;
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
                int userNo = user.getUserNo();
                //마이페이지
                model.addAttribute("user", user);
                List<LectureDTO> list = userService.lectUser(userNo);
                List<LectureDTO> wishlist = userService.wishUser(userNo);
                //내가 수강중인 강의 목록
                model.addAttribute("lecturelist", list);
                //찜한 목록
                model.addAttribute("wishlist", wishlist);
                return "user/user_mypage";
            }
        }
        redirect.addFlashAttribute("message", "로그인필요");
        return "user/user_login";
    }

    // 사용자 정보 수정
    @GetMapping(value = {"/user_update", "/user_update/{user_id}"})
    public String updateUser(HttpSession session
            , Model model
            , @PathVariable(required = false) String user_id) {

        UserDTO sessionUser = (UserDTO) session.getAttribute("dto");
        String userId;
        if (sessionUser != null) {
            if ("admin".equals(sessionUser.getUserId())) {
                userId = user_id;
            } else {
                userId = sessionUser.getUserId();
            }
            UserDTO user = userService.detailUser(userId);
            model.addAttribute("user", user);
        }

        return "user/user_update";
    }

    @PostMapping(value = {"/updateresult", "/user_update/{user_id}"})
    public String updateUserResult(@PathVariable(required = false) String user_id
            , @ModelAttribute UserDTO dto
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
            return "redirect:/user_manager";
        } else {
            return "redirect:/index";
        }
    }

    @GetMapping("/user_delete/{userNo}")
    public String deleteUser(HttpServletRequest request, @PathVariable int userNo
            , Model model) {
        int result = userService.deleteUser(userNo);
        model.addAttribute("result", result);

        return "redirect:/user_manager";
    }

    //관리자 페이지
    @GetMapping(value = {"/user_manager", "/user_manager/{curr}"})
    public String user_manager(HttpServletRequest request, Model model
            , RedirectAttributes redirect
            , @PathVariable(required = false) String curr
            , @RequestParam(required = false, defaultValue = "") String search
            , @RequestParam(required = false, defaultValue = "") String search_txt) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            UserDTO user = (UserDTO) session.getAttribute("dto");
            if (user != null) {
                // 사용자 아이디가 "admin"인지 확인
                if ("admin".equals(user.getUserId())) {
                    // 관리자 페이지로 이동
                    int currpage = 1;
                    if (curr != null)
                        currpage = Integer.parseInt(curr);
                    int totalCount = userService.getUserCount(search, search_txt);
                    int pageSize = 10;
                    int blockSize = 5;
                    MakePage page = new MakePage(currpage, totalCount, pageSize, blockSize);
                    List<UserDTO> list = userService.listUser(page.getStartRow(), pageSize, search, search_txt);
                    model.addAttribute("list", list);
                    model.addAttribute("page", page);
                    model.addAttribute("search", search);
                    model.addAttribute("search_txt", search_txt);

                    //차트 데이터 넘김
                    List<ChartDTO> chart_data = userService.getChartData();
                    model.addAttribute("chart_data", chart_data);

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
//강의 리스트
    @GetMapping(value = {"/order_list","/order_list/{curr}"})
    public String order_list(HttpServletRequest request
            , @PathVariable(required = false) String curr
            , Model model
            , RedirectAttributes redirect) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            UserDTO user = (UserDTO) session.getAttribute("dto");
            if (user != null) {
                if ("admin".equals(user.getUserId())) {
                    int currpage = 1;
                    if (curr != null)
                        currpage = Integer.parseInt(curr);
                    int totalCount = orderService.getOrderCount();
                    int pageSize = 10;
                    int blockSize = 5;
                    MakePage page = new MakePage(currpage, totalCount, pageSize, blockSize);
                    List<OrderDTO> list = orderService.listOrder(page.getStartRow(),pageSize);
                    model.addAttribute("list", list);
                    model.addAttribute("page",page);

                    //차트 데이터 넘김
                    List<ChartDTO> chart_data = userService.getChartData();
                    model.addAttribute("chart_data", chart_data);

                    return "order/order_list";
                } else {
                    model.addAttribute("user", user);
                    redirect.addFlashAttribute("message", "관리자만 접속 가능합니다.");
                    return "redirect:/index";
                }
            }
        }
        redirect.addFlashAttribute("message", "로그인필요");
        return "redirect:/user_login";
    }

    @PostMapping("/updateAuthority")
    public String updateAuth(@RequestParam Map<String, String> params) {
        Map<String, Boolean> hm = new HashMap<>();

        // 파라미터 맵에서 orderNo와 authority 값 추출
        for (Map.Entry<String, String> entry : params.entrySet()) {
            String key = entry.getKey();

            // orderNo_로 시작하는 키를 찾습니다.
            if (key.startsWith("orderNo_")) {
                String orderNo = entry.getValue(); // orderNo 값을 추출합니다.
                String authKey = "authority_" + orderNo; // 해당 orderNo에 대한 authority 키를 생성합니다.

                // authority 값이 "true"인지 확인합니다.
                boolean authority = params.containsKey(authKey) && "true".equals(params.get(authKey));
                hm.put(orderNo, authority); // orderNo와 authority 값을 Map에 저장합니다.
            }
        }
        orderService.updateAuthorities(hm);
        return "redirect:/order_list";
    }
}
