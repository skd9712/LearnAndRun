package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.MakePage;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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

        return "main/index";
    }

    /** 강의 등록 폼 */
    @GetMapping("/lecture_insert")
    public String insertLecture(){
        return "lecture/lecture_insert";
    }

    /** 강의 등록 결과 */
    @PostMapping("/lecture_insert_result")
    public String insertLectureResult(HttpServletRequest request
            , LectureDTO dto
            , Model model){

        String path="upload/img";
        String uploadPath=request.getSession().getServletContext().getRealPath(path);

/*        LectureDTO dto=new LectureDTO();
        dto.setThumbnailFile(thumbnailFile);
        dto.setLectureName(lectureName);
        dto.setTeacher(teacher);
        dto.setDescription(description);
        dto.setSubjectName(subjectName);
        dto.setTarget(target);
        dto.setPrice(price);
        dto.setStartDate(startDate);
        dto.setLectureDataFile(lectureDataFile);*/

        int result=service.insertLecture(uploadPath, dto);

        return "redirect:lecture_list";
    }


    /** 이미지 */
    @GetMapping(value = "/getImage/{filename}"
            , produces = {MediaType.IMAGE_GIF_VALUE
            , MediaType.IMAGE_PNG_VALUE})
    public ResponseEntity<byte[]> getThumbnail(HttpServletRequest request
            , @PathVariable String filename){

        String path="/upload/img";
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
    public  ResponseEntity<Resource> getFile(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response){

        String path="/upload/img";
        String realpath=  request.getSession().getServletContext().getRealPath(path);

        String fname= URLEncoder.encode(filename, StandardCharsets.UTF_8).replace("+","%20");

        File file=new File(realpath+"/" + fname);
        if(!file.exists()) return new ResponseEntity<>(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();

        Resource resource;
        try {
            resource= new InputStreamResource(new FileInputStream(file));
            response.setHeader("Content-Type", "application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename="+fname);
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
    public String detailLecture(@PathVariable int lectureNo, Model model){

        LectureDTO dto=service.detailLecture(lectureNo);
        model.addAttribute("dto", dto);
        return "lecture/lecture_detail";
    }

    /** 강의 수정 폼 */
    @GetMapping("/lecture_update/{lectureNo}")
    public String updateLecture(@PathVariable int lectureNo, Model model){

        LectureDTO dto=service.detailLecture(lectureNo);
        model.addAttribute("dto", dto);
        return "lecture/lecture_update";
    }

    @PostMapping("/lecture_update_result")
    public String updateLectureResult(HttpServletRequest request, LectureDTO dto){

        String path="upload/img";
        String uploadPath=request.getSession().getServletContext().getRealPath(path);

        service.updateLecture(uploadPath, dto);

        return "redirect:lecture_list";
    }

    /** 강의 삭제 */
    @GetMapping("/lecture_delete/{lectureNo}")
    public String deleteLecture(@PathVariable int lectureNo, Model model){

        int result=service.deleteLecture(lectureNo);

        model.addAttribute("result", result);

        return "lecture/lecture_delete";
    }
}
