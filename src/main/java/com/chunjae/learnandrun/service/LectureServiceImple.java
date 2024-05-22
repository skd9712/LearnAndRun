package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.LectureMapper;
import com.chunjae.learnandrun.dto.LectureDTO;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class LectureServiceImple implements LectureService{

    private LectureMapper mapper;
    @Autowired
    public LectureServiceImple(LectureMapper mapper){
        this.mapper=mapper;
    }
    @Override
    public int getCount(String search, String search_txt) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("search", search);
        hm.put("search_txt", search_txt);

        int result=mapper.getCount(hm);

        return result;
    }

    @Override
    public List<LectureDTO> listLecture(int startRow, int pageSize, String search, String search_txt, String sort) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("startRow", startRow);
        hm.put("pageSize", pageSize);
        hm.put("search", search);
        hm.put("search_txt", search_txt);
        hm.put("sort", sort);

        List<LectureDTO> list=mapper.listLecture(hm);

        return list;
    }

    @Override
    public List<LectureDTO> before_open_lecture() {
        List<LectureDTO> list = mapper.before_open_lecture();
        return list;
    }

    @Override
    public List<LectureDTO> new_lecture() {
        List<LectureDTO> list = mapper.new_lecture();
        return list;
    }

    @Override
    public LectureDTO detailLecture(int lectureNo) {
        LectureDTO dto=mapper.detailLecture(lectureNo);
        return dto;
    }

    @Override
    public int deleteLecture(int lectureNo) {
        int result=mapper.deleteLecture(lectureNo);
        return result;
    }

    @Override
    public int insertLecture(String uploadPath, LectureDTO dto) {

        String thumbnail=thumbnailUpload(uploadPath, dto);
        dto.setThumbnail(thumbnail);

        String zip=zipUpload(uploadPath, dto);
        dto.setLectureData(zip);

        int result=mapper.insertLecture(dto);

//        int result=mapper.insertLecture();


        return result;
    }

    @Override
    public void updateLecture(String uploadPath, LectureDTO dto) {

        String thumbnail=thumbnailUpload(uploadPath, dto);
        dto.setThumbnail(thumbnail);
        
        //수정 전 파일 삭제 기능 추가하기

        String zip=zipUpload(uploadPath, dto);
        dto.setLectureData(zip);
        
        mapper.updateLecture(dto);
    }

    /** 썸네일 업로드 */
    private String thumbnailUpload(String uploadPath, LectureDTO dto){


        System.out.println();
        System.out.println();
        System.out.println("가나다라");
        System.out.println();
        System.out.println();
        MultipartFile multi= dto.getThumbnailFile();


        String originalFilename=multi.getOriginalFilename();
        originalFilename= URLEncoder.encode(originalFilename, StandardCharsets.UTF_8)
                .replace("+", "%20");
        String thumbnailName="";

        try{
            if(!multi.isEmpty()){
                UUID uuid= UUID.randomUUID();
                String fileName=uuid+"_"+originalFilename;
                File file=new File(uploadPath, fileName);
                multi.transferTo(file);


                //썸네일 업로드
                thumbnailName="thumbnail_"+uuid+"_"+originalFilename;
                String thumbnailPath=uploadPath+"/"+thumbnailName;

                File thumbnail=new File(thumbnailPath);
                Thumbnailator.createThumbnail(file, thumbnail, 240, 180);

                //로컬에 업로드
                String localPath="D:\\LearnAndRun_test\\src\\main\\webapp\\upload\\img"
                        +"/"+"thumbnail_"+uuid+"_"+originalFilename;
                File thumbnailLocal=new File(localPath);
                Thumbnailator.createThumbnail(file, thumbnailLocal, 240, 180);

                //원본 이미지 삭제
                file.delete();

            }
        }catch (IOException e){
            System.out.println(e);
        }

        return thumbnailName;
    }

    /** zip파일 업로드 */
    private String zipUpload(String uploadPath, LectureDTO dto){

        MultipartFile multi= dto.getLectureDataFile();


        String originalFilename=multi.getOriginalFilename();
        originalFilename= URLEncoder.encode(originalFilename, StandardCharsets.UTF_8)
                .replace("+", "%20");
        String zipName="";

        try{
            if(!multi.isEmpty()){
                UUID uuid= UUID.randomUUID();
                String fileName=uuid+"_"+originalFilename;
                File file=new File(uploadPath, fileName);
                multi.transferTo(file);

                zipName="lecture_"+uuid+"_"+originalFilename;

                //로컬에 업로드
                String localPath="D:\\LearnAndRun_test\\src\\main\\webapp\\upload\\img"
                        +"/"+"lecture_"+uuid+"_"+originalFilename;
                File zipLocal=new File(localPath);
                multi.transferTo(zipLocal);
            }
        }catch (IOException e){
            System.out.println(e);
        }

        return zipName;
    }
}
