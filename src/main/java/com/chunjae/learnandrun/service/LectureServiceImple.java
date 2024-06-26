package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.LectureMapper;
import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.WishDTO;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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
    public List<LectureDTO> hot_lecture() {
        List<LectureDTO> list = mapper.hot_lecture();
        return list;
    }

    @Override
    public String getAuthority(int lectureNo, String userId) {

        HashMap<String, Object> hm=new HashMap<>();
        hm.put("lectureNo", lectureNo);
        hm.put("userId", userId);

        int result=mapper.getAuthority(hm);

        if(result>0)
            return "true";
        else
            return "false";
    }

    @Override
    public boolean wishList(int userNo, int lectureNo) {

        HashMap<String, Object> hm=new HashMap<>();
        hm.put("userNo", userNo);
        hm.put("lectureNo", lectureNo);

        int result=mapper.wishList(hm);
        boolean wish=false;

        if(result>0)
            wish=true;

        return wish;
    }

    @Override
    public int deleteWish(int userNo, int lectureNo) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("userNo", userNo);
        hm.put("lectureNo", lectureNo);
        int result=mapper.deleteWish(hm);

        return result;
    }

    @Override
    public int insertWish(int userNo, int lectureNo) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("userNo", userNo);
        hm.put("lectureNo", lectureNo);
        int result=mapper.insertWish(hm);

        return result;
    }


    @Override
    public LectureDTO detailLecture(int lectureNo) {
        LectureDTO dto=mapper.detailLecture(lectureNo);
        return dto;
    }

    @Override
    public int deleteLecture(String uploadPath, int lectureNo) {

        String thumbnailName=detailLecture(lectureNo).getThumbnail();
        String lectureDataName=detailLecture(lectureNo).getLectureData();

        int result=mapper.deleteLecture(lectureNo);

        if(result>0){
            File file1=new File(uploadPath+"/thumbnail/"+thumbnailName);
            file1.delete();
            File file2=new File(uploadPath+"/lectureData/"+lectureDataName);
            file2.delete();
        }

        return result;
    }

    @Override
    public int insertLecture(String uploadPath, LectureDTO dto) {

        String thumbnailPath=uploadPath+"/thumbnail";
        String thumbnail=thumbnailUpload(thumbnailPath, dto);
        dto.setThumbnail(thumbnail);

        String lectureDataPath=uploadPath+"/lectureData";
        String lectureData=lectureDataUpload(lectureDataPath, dto);
        dto.setLectureData(lectureData);

        int result=mapper.insertLecture(dto);

//        int result=mapper.insertLecture();


        return result;
    }

    @Override
    public int updateLecture(String uploadPath, LectureDTO dto, boolean ThumbnailIsEmpty, boolean LectureDataIsEmpty) {

        if(!ThumbnailIsEmpty){
            String thumbnailPath=uploadPath+"/thumbnail";
            String thumbnail=thumbnailUpload(thumbnailPath, dto);
            dto.setThumbnail(thumbnail);
            File file=new File(uploadPath+"/thumbnail/"+detailLecture(dto.getLectureNo()).getThumbnail());
            file.delete();
        }

        if(!LectureDataIsEmpty){
            String lectureDataPath=uploadPath+"/lectureData";
            String lectureData=lectureDataUpload(lectureDataPath, dto);
            dto.setLectureData(lectureData);
            File file=new File(uploadPath+"/lectureData/"+detailLecture(dto.getLectureNo()).getLectureData());
            file.delete();
        }

        HashMap<String, Object> hm=new HashMap<>();
        hm.put("dto", dto);
        hm.put("ThumbnailIsEmpty", ThumbnailIsEmpty);
        hm.put("LectureDataIsEmpty", LectureDataIsEmpty);
        
        int result=mapper.updateLecture(hm);

        return result;
    }

    /** 썸네일 업로드 */
    private String thumbnailUpload(String uploadPath, LectureDTO dto){

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
//                Thumbnailator.createThumbnail(file, thumbnail, 480, 360);
                Thumbnails.of(file).size(480, 360).toFile(thumbnail);
                //원본 이미지 삭제
                file.delete();

            }
        }catch (IOException e){
            System.out.println(e);
        }

        return thumbnailName;
    }

    /** lectureData zip 파일 업로드 */
    private String lectureDataUpload(String uploadPath, LectureDTO dto){

        MultipartFile multi= dto.getLectureDataFile();


        String originalFilename=multi.getOriginalFilename();
        originalFilename= URLEncoder.encode(originalFilename, StandardCharsets.UTF_8)
                .replace("+", "%20");
        String lectureDataName="";

        try{
            if(!multi.isEmpty()){
                UUID uuid= UUID.randomUUID();
                lectureDataName="lecture_"+uuid+"_"+originalFilename;
                File file=new File(uploadPath, lectureDataName);
//                String fileName=uuid+"_"+originalFilename;
//                File file=new File(uploadPath, fileName);
                multi.transferTo(file);

            }
        }catch (IOException e){
            System.out.println(e);
        }

        return lectureDataName;
    }
}
