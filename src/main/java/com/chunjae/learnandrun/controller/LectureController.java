package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.MakePage;
import com.chunjae.learnandrun.dto.UserDTO;
import com.chunjae.learnandrun.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;

@Controller
public class LectureController {

    private final LectureService service;
    @Autowired
    public LectureController(LectureService service){
        this.service=service;
    }

    /** 강의 리스트 */
    @GetMapping(value = {"/lecture_list", "/lecture_list/{curr}"})
    public String listLecture(@PathVariable(required = false) String curr
            , @RequestParam(required = false, defaultValue = "") String search
            , @RequestParam(required = false, defaultValue = "") String search_txt
            , @RequestParam(required = false, defaultValue = "") String sort
            , Model model){

        /* 현재 페이지 */
        int currPage=1;
        if(curr!=null)
            currPage = Integer.parseInt(curr);

        /* 자료 카운트 */
        int totalCount=service.getCount(search, search_txt);


        /* 페이지 */
        int pageSize=12;
        int blockSize=5;
        MakePage page=new MakePage(currPage, totalCount, pageSize, blockSize);

        List<LectureDTO> list=service.listLecture(page.getStartRow(), pageSize, search, search_txt, sort);

        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("search", search);
        model.addAttribute("search_txt", search_txt);
        model.addAttribute("sort", sort);

        model.addAttribute("contentpage","lecture_list");

        return "lecture/lecture_list";
    }

    /** 강의 등록 폼 */
    @GetMapping("/lecture_insert")
    public String insertLecture(HttpSession session){

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");

        if(userDTO!=null){
            if("admin".equals(userDTO.getUserId()))
                return "lecture/lecture_insert";
            else
                return "redirect:/lecture_list";
        }else{
            return "redirect:/user_login";
        }
    }

    /** 강의 등록 결과 */
    @PostMapping("/lecture_insert_result")
    public String insertLectureResult(HttpServletRequest request
            , LectureDTO dto
            , Model model){

        String path="upload";
        String uploadPath=request.getSession().getServletContext().getRealPath(path);

        int result=service.insertLecture(uploadPath, dto);
        model.addAttribute("result", result);

        return "lecture/lecture_insert_result";
    }


    /** 이미지 */
    @GetMapping(value = "/getImage/{filename}"
            , produces = {MediaType.IMAGE_GIF_VALUE
            , MediaType.IMAGE_PNG_VALUE})
    public ResponseEntity<byte[]> getThumbnail(HttpServletRequest request
            , @PathVariable String filename){

        String path="/upload/thumbnail";
        String realpath= request.getSession().getServletContext().getRealPath(path);
        String fname = URLEncoder.encode(filename, StandardCharsets.UTF_8)
                .replace("+", "%20");
        InputStream in = null;
        ResponseEntity<byte[]> entity=null;
        try {
            in = new FileInputStream(realpath + "/" + fname);
            System.out.println("in....."+in);
            HttpHeaders headers=new HttpHeaders();

            entity=new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(in)
                    ,headers,  HttpStatus.OK);
        }catch(IOException e)
        {
            entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /** 다운로드 */
    @GetMapping(value="/download/{filename}")
    @ResponseBody
    public  ResponseEntity<Resource> getFile(@PathVariable String filename
            , HttpServletRequest request, HttpServletResponse response){

        String path="/upload/lectureData";
        String realpath=  request.getSession().getServletContext().getRealPath(path);

        String fname= URLEncoder.encode(filename, StandardCharsets.UTF_8).replace("+","%20");
        // 업로드 전 파일 이름으로 다운되도록
        int fnameIndex=fname.indexOf("_", fname.indexOf("_")+1);
        String fnameChange=fname.substring(fnameIndex+1);

        File file=new File(realpath+"/" + fname);
        if(!file.exists()) return new ResponseEntity<>(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();

        Resource resource;
        try {
            resource= new InputStreamResource(new FileInputStream(file));
            response.setHeader("Content-Type", "application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename="+fnameChange);
            headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");
            headers.add("contentType","utf-8");
            headers.setContentLength(file.length());
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        } catch(IOException e)
        {
            System.out.println("error....."+e);
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>( resource, headers, HttpStatus.OK);
    }


    /** 강의 상세 */
    @GetMapping("/lecture_detail/{lectureNo}")
    public String detailLecture(HttpSession session
            , @PathVariable int lectureNo, Model model){

        LectureDTO dto=service.detailLecture(lectureNo);

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");
        String authority="";
        String user="";

        if(userDTO!=null){
            if("admin".equals(userDTO.getUserId())){
                authority="admin";
            }else{
                authority=service.getAuthority(lectureNo, userDTO.getUserId());
            }
            user="true";
        }else{
            authority="false";
            user="false";
        }
        
        if(dto!=null){
            model.addAttribute("dto", dto);
            model.addAttribute("authority", authority);
            model.addAttribute("user", user);
            return "lecture/lecture_detail";
        }else{
            //존재하지 않는 강의인 경우
            return "lecture/lecture_not_exist";
        }
    }

    /** 강의 수정 폼 */
    @GetMapping("/lecture_update/{lectureNo}")
    public String updateLecture(HttpSession session, @PathVariable int lectureNo, Model model){

        LectureDTO dto=service.detailLecture(lectureNo);

        if(dto!=null){
            model.addAttribute("dto", dto);

            UserDTO userDTO= (UserDTO) session.getAttribute("dto");

            if(userDTO!=null){
                if("admin".equals(userDTO.getUserId()))
                    return "lecture/lecture_update";
                else
                    return "redirect:/lecture_list";
            }else{
                return "redirect:/user_login";
            }
        }else{
            //존재하지 않는 강의인 경우
            return "lecture/lecture_not_exist";
        }
    }

    /** 강의 수정 결과 */
    @PostMapping("/lecture_update_result")
    public String updateLectureResult(HttpServletRequest request, LectureDTO dto, Model model){

        boolean ThumbnailIsEmpty=false;
        boolean LectureDataIsEmpty=false;

        if(dto.getThumbnailFile().isEmpty()){
            //이전 파일로 유지
            ThumbnailIsEmpty=true;
        }

        if(dto.getLectureDataFile().isEmpty()){
            //이전 파일로 유지
            LectureDataIsEmpty=true;
        }

        String path="upload";
        String uploadPath=request.getSession().getServletContext().getRealPath(path);

        int result=service.updateLecture(uploadPath, dto, ThumbnailIsEmpty, LectureDataIsEmpty);
        model.addAttribute("result", result);
        model.addAttribute("lectureNo", dto.getLectureNo());

        return "lecture/lecture_update_result";
    }

    /** 강의 삭제 */
    @GetMapping("/lecture_delete/{lectureNo}")
    public String deleteLecture(HttpServletRequest request
            , HttpSession session
            , @PathVariable int lectureNo, Model model){

        String path="upload";
        String uploadPath=request.getSession().getServletContext().getRealPath(path);

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");

        LectureDTO dto=service.detailLecture(lectureNo);

        if(dto!=null){
            if(userDTO!=null){
                if("admin".equals(userDTO.getUserId())){
                    int result=service.deleteLecture(uploadPath, lectureNo);
                    model.addAttribute("result", result);
                    model.addAttribute("lectureNo", lectureNo);
                    return "lecture/lecture_delete_result";
                }
                else
                    return "redirect:/lecture_list";
            }else{
                return "redirect:/user_login";
            }
        }else{
            //존재하지 않는 강의인 경우
            return "lecture/lecture_not_exist";
        }

    }

    /** 강의 찜 여부 */
    @GetMapping("/wish_list/{lectureNo}")
    public @ResponseBody boolean wishList(HttpSession session
            , @PathVariable int lectureNo){

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");

        boolean wish=false;

        if(userDTO!=null)
            wish=service.wishList(userDTO.getUserNo(), lectureNo);

        return wish;
    }

    /** 강의 찜 & 취소 */
    @PostMapping("/insert_wish")
    public @ResponseBody String insertWish(HttpSession session
            , @RequestBody HashMap<String, Object> hm){

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");
        String wish= (String) hm.get("wish");
        int lectureNo= (int) hm.get("lectureNo");
        int result;

        if(userDTO!=null) {
            // 찜 취소
            if ("true".equals(wish)) {
                result = service.deleteWish(userDTO.getUserNo(), lectureNo);
            }
            // 찜 추가
            else if ("false".equals(wish)) {
                result = service.insertWish(userDTO.getUserNo(), lectureNo);
            }
        }
        return wish;
    }

}
