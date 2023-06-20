package com.board.controller;

import com.board.domain.BoardVO;
import com.board.domain.PageMaker;
import com.board.domain.SearchCriteria;
import com.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class SaveController {
    @Inject
    private BoardService service;
    private static final String CURR_IMAGE_REPO_PATH = "C://0521/src/main/webapp/resources/static/upload/";

    // 게시물 임시작성
    @RequestMapping(value = "/save", method = RequestMethod.GET)
    public void getsave(HttpSession session, Model model) throws Exception {
        Object loginInfo = session.getAttribute("member");

        if (loginInfo == null) {
            model.addAttribute("msg", false);
        }
    }

    // 게시물 임시작성
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String postsave(BoardVO vo, MultipartHttpServletRequest multipartRequest,MultipartFile upfile,
                           HttpSession session, @RequestParam("category") String category) throws Exception {

        // 카테고리 정보 처리
        vo.setCategory(category);

        if (!upfile.getOriginalFilename().equals("")) {

            String changeName = saveFile(session, upfile);
            File file = new File(CURR_IMAGE_REPO_PATH + changeName);   //프로젝트에 사진 파일 생성

            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }

            upfile.transferTo(file);  //프로젝트에 사진 저장
            vo.setImgPath(changeName);
        }else{
            vo.setImgPath("Fooriend.png");
        }
        service.save(vo);
        return "redirect:/board/listPageSearch?page=1";
    }

    // 임시 저장 게시물 조회
    @RequestMapping(value = "save/saveview", method = RequestMethod.GET)
    public void getsaveView(@RequestParam("bno") int bno, Model model) throws Exception {

        BoardVO vo = service.saveview(bno);
        model.addAttribute("saveview", vo);
    }

    // 임시저장 게시물 수정
    @RequestMapping(value = "save/savemodify", method = RequestMethod.GET)
    public void getsaveModify(@RequestParam("bno") int bno, Model model) throws Exception {

        BoardVO vo = service.saveview(bno);
        model.addAttribute("saveview", vo);
    }



    // 임시저장 게시물 수정
    @RequestMapping(value = "save/savemodify", method = RequestMethod.POST)
    public String postsaveModify(BoardVO vo, MultipartHttpServletRequest multipartRequest, MultipartFile reupfile,
                                 HttpSession session ) throws Exception {
        // 새로온 첨부파일이 있었을 때
        if(!reupfile.getOriginalFilename().equals("")) {

            if(vo.getImgPath()!=null) {
                new File(session.getServletContext().getRealPath(vo.getImgPath())).delete();
            }
            String changeName = saveFile(session,reupfile);
            vo.setImgPath("resources/images/board/"+changeName);
        }

        service.savemodify(vo);
        return "redirect:/board/listPageSearch?page=1";
    }

    @RequestMapping(value = "save/savelistPageSearch", method = RequestMethod.GET)
    public void savelistPageSearch(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
        if (cri.getPerPageNum() == 0) {
            cri.setPerPageNum(10);
        }

        if (cri.getSearchType() == null || cri.getSearchType().equals("")) { // 검색 조건이 빈 값인 경우
            cri.setSearchType(""); // 검색 조건을 기본값
        }

        if (cri.getOrderBy() == null || cri.getOrderBy().equals("")) { // 정렬 조건이 빈 값인 경우
            cri.setOrderBy("regDate"); // 정렬 조건을 기본값인 'new'로 설정
        }

        cri.setStatus("F"); // status를 'F'로 설정하여 임시저장 게시글만 조회되도록 합니다.

        int total = service.savesearchCount(cri);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(cri);
        pageMaker.setTotalCount(total);

        model.addAttribute("savelist", service.savelistPageSearch(cri));
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("searchType", cri.getSearchType());
        model.addAttribute("keyword", cri.getKeyword());
    }

    //썸네일 난수로 해서 저장
    public String saveFile(HttpSession session,MultipartFile file) {
        String originName = file.getOriginalFilename();
        //20210702(년월일) + 23432(랜덤값) + .jpg(원본파일확장자)
        String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
        int ranNum = (int)(Math.random() * 90000 + 10000);
        String ext = originName.substring(originName.lastIndexOf("."));//.다음 인덱스부터의 문자열 추출
        String changeName = currentTime + "_" + ranNum + ext;

        return changeName;

    }

}
