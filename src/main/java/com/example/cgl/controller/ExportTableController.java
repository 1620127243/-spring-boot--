package com.example.cgl.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.example.cgl.entity.AccountMeeting;
import com.example.cgl.entity.Meeting;
import com.example.cgl.serviceImpl.AccountMeetingServiceImpl;
import com.example.cgl.serviceImpl.MeetingServiceImpl;
import com.example.cgl.util.QRCodeUtils;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("/export")
public class ExportTableController extends HttpServlet {
    @Autowired
    private AccountMeetingServiceImpl accountMeetingService;
    @Autowired
    private MeetingServiceImpl meetingService;

    @RequestMapping(value = "/exportExcel",method = RequestMethod.POST)
    public void exportExcel( HttpServletResponse response,@RequestParam("meetingID") String meetingID) throws IOException{
        System.out.println(meetingID);

        HSSFWorkbook workbook=new HSSFWorkbook();
        HSSFSheet sheet=workbook.createSheet("会议信息表");

        setTitle(workbook,sheet);
        // 获取用户信息
        List<AccountMeeting> list = accountMeetingService.selectMyMeetingInfo(meetingID);
        int rowNum=1;
        for(AccountMeeting accountMeeting:list){
            HSSFRow row=sheet.createRow(rowNum);
            row.createCell(0).setCellValue(accountMeeting.getMeetingID());
            row.createCell(1).setCellValue(accountMeeting.getAccountID());
            row.createCell(2).setCellValue(accountMeeting.getParticipantName());
            row.createCell(3).setCellValue(accountMeeting.getParticipantSex());
            row.createCell(4).setCellValue(accountMeeting.getParticipantPhone());
            row.createCell(5).setCellValue(accountMeeting.getParticipantWork());
            row.createCell(6).setCellValue(accountMeeting.getNeedHotel());
            row.createCell(7).setCellValue(accountMeeting.getParticipantIdentity());
            rowNum++;
        }
        String fileName="会议信息.xls";
        response.reset();
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream os=new BufferedOutputStream(response.getOutputStream());
        response.setContentType("application/vnd.ms-excel; charset=utf-8");
        workbook.write(os);
        os.flush();
        os.close();
    }

    @RequestMapping(value = "/getCode",method = RequestMethod.POST)
    public void getGode( HttpServletResponse response,@RequestParam("meetingID") String meetingID)throws IOException{
        Meeting meeting=meetingService.selectMeeting(meetingID).get(0);
        response.setContentType("image/jpg");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        OutputStream stream = response.getOutputStream();
        BitMatrix bitMatrix = QRCodeUtils.createCode(meeting.toString());
        MatrixToImageWriter.writeToStream(bitMatrix , "jpg" , stream);

    }

    private void setTitle(HSSFWorkbook workbook, HSSFSheet sheet){
        HSSFRow row = sheet.createRow(0);
        //设置列宽，setColumnWidth的第二个参数要乘以256，这个参数的单位是1/256个字符宽度
        sheet.setColumnWidth(0, 10*256);
        sheet.setColumnWidth(1, 20*256);
        sheet.setColumnWidth(2, 20*256);
        sheet.setColumnWidth(3, 20*256);
        sheet.setColumnWidth(4, 20*256);
        sheet.setColumnWidth(5, 20*256);
        sheet.setColumnWidth(6, 20*256);

        sheet.setColumnWidth(7, 100*256);

        //设置为居中加粗
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        style.setFont(font);

        HSSFCell cell;
        cell = row.createCell(0);
        cell.setCellValue("会议编号");
        cell.setCellStyle(style);


        cell = row.createCell(1);
        cell.setCellValue("参会者账号");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("参会者姓名");
        cell.setCellStyle(style);


        cell = row.createCell(3);
        cell.setCellValue("参会者性别");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("参会者联系方式");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("参会者工作单位");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("参会者是否需要宾馆");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("参会者身份证号");
        cell.setCellStyle(style);
    }
}

