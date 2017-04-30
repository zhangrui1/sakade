package com.toyo.vc.controller;

/**
 * Created by 維瑞 on 2015/07/14.
 */

import java.io.FileInputStream;
import java.io.*;

import com.itextpdf.text.Font;
import org.apache.poi.ss.usermodel.*;

import java.net.URLEncoder;
import java.util.Iterator;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/test")
public class test {

    /**
     * To PDF
     * */
    @RequestMapping(value="/toPdf", method= RequestMethod.GET)
    public static boolean toPdf(HttpSession session,HttpServletResponse res) throws IOException, DocumentException {

        //Excelを読み込む
        /*DLファイル名を設定*/
        String encordeUrl= URLEncoder.encode("Excel2PDF_Output.pdf", "UTF-8");
        /*コンテキストにDLファイル情報を設定する*/
        res.setContentType("application/msexcel;charset=UTF-8");
        res.setHeader("Content-Disposition", "attachment; filename=" + encordeUrl);

        FileInputStream input_document = new FileInputStream("excel/test.xlsx");
        XSSFWorkbook my_xls_workbook=new XSSFWorkbook(input_document);
        // Read worksheet into HSSFSheet
        XSSFSheet my_worksheet = my_xls_workbook.getSheetAt(0);
        // To iterate over the rows
        Iterator<Row> rowIterator = my_worksheet.iterator();
        //We will create output PDF document objects at this A4 横 サイズへ変更するには
//        Document iText_xls_2_pdf = new Document(PageSize.A4.rotate());//A4 横
        Document iText_xls_2_pdf = new Document(PageSize.A4);//A4 縦
        PdfWriter.getInstance(iText_xls_2_pdf, res.getOutputStream());
        iText_xls_2_pdf.open();
        //we have two columns in the Excel sheet, so we create a PDF table with two columns
        //Note: There are ways to make this dynamic in nature, if you want to.
        // 用紙のサイズの取得
        float width = iText_xls_2_pdf.getPageSize().getWidth();
        float height = iText_xls_2_pdf.getPageSize().getHeight();

        PdfPTable my_table = new PdfPTable(7);
        my_table.getDefaultCell().setBorder(0);
        my_table.setHorizontalAlignment(0);
        my_table.setTotalWidth(width - 72);
        my_table.setLockedWidth(true);
        //We will use the object below to dynamically add new data to the table
        PdfPCell table_cell;
        BaseFont bf =BaseFont.createFont("HeiseiKakuGo-W5", "UniJIS-UCS2-H",false);
        Font font=new Font(bf,12);
        //Loop through rows
        while(rowIterator.hasNext()) {
            Row row = rowIterator.next();
            Iterator<Cell> cellIterator = row.cellIterator();
            for(int nIndex=0;nIndex<7;nIndex++){
                Cell cell=row.getCell(nIndex);
                String tmp="";
                if(cell!=null){
                    switch(cell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:
                            tmp=cell.getStringCellValue();
//                        case Cell.CELL_TYPE_NUMERIC:
//                            tmp=cell.getNumericCellValue()+"";
                    }
                }else{
                    tmp="a";
                }
                table_cell=new PdfPCell(new Phrase(tmp,font));
                my_table.addCell(table_cell);
            }
//            while(cellIterator.hasNext()) {
//                Cell cell = cellIterator.next(); //Fetch CELL
//                int typenum=cell.getCellType();
//                String a=cell.getStringCellValue();
//                switch(cell.getCellType()) { //Identify CELL type
                    //you need to add more code here based on
                    //your requirement / transformations
//                    case Cell.CELL_TYPE_STRING:
                        //Push the data from Excel to PDF Cell
//                        table_cell=new PdfPCell(new Phrase(cell.getStringCellValue(),font));
//                        my_table.addCell(table_cell);
//                        break;
//                }
                //next line
//            }

        }
        //Finally add the table to PDF document
        iText_xls_2_pdf.add(my_table);
        iText_xls_2_pdf.close();
        //we created our pdf file..
        input_document.close(); //close
        return  true;
    }
}