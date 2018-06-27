package com.xyauto.qa.util;


import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataException;
import com.drew.metadata.exif.ExifDirectory;
import com.xyauto.qa.cons.CommonCons;
import com.xyauto.qa.core.annotation.Log;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;

/**
 * Created by shiqm on 2017/3/20.
 */
@Component
public class ImageHelper {


    @Log
    private Logger logger;

    /***
     * 按指定的比例缩放图片
     *
     * @param file            源文件
     * @param destinationFile 改变大小后图片的地址
     */
    public boolean scaleImage(File file,
                              File destinationFile, String format) {

        BufferedImage bufferedImage;
        try {
            //先处理图片，如果需要选择则先处理
            int angle = this.getRotateAngleForPhoto(file);
            if (angle != 0) {
                logger.info("图片需要跳转角度:{}", angle);
                this.rotatePhonePhoto(file,format,angle);
            }

            bufferedImage = ImageIO.read(file);
            int width = bufferedImage.getWidth();
            int height = bufferedImage.getHeight();

            if (width <= CommonCons.Config_Flag.PICTURE_WIDTH && height <= CommonCons.Config_Flag.PICTURE_HEIGHT) {
                return true;
            }
            BigDecimal b1 = new BigDecimal(String.valueOf(width));
            BigDecimal b2 = new BigDecimal(String.valueOf(CommonCons.Config_Flag.PICTURE_WIDTH));
            double scale = b2.divide(b1, 2, BigDecimal.ROUND_HALF_UP).doubleValue();
            logger.info("原宽:{}", width);
            logger.info("原长:{}", height);
            logger.info("比例为:{}", scale);
            width = parseDoubleToInt(width * scale);
            height = parseDoubleToInt(height * scale);
            logger.info("自动调整比例，width={} height={}", width, height);
            Image image = bufferedImage.getScaledInstance(width, height,
                    Image.SCALE_SMOOTH);
            BufferedImage outputImage = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics graphics = outputImage.getGraphics();
            graphics.drawImage(image, 0, 0, null);
            graphics.dispose();
            ImageIO.write(outputImage, format, destinationFile);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }


    /***
     * 将图片缩放到指定的高度或者宽度
     *
     * @param file            图片源文件
     * @param destinationFile 压缩完图片的地址
     * @param format          图图片格式 例如 jpg
     */
    public boolean scaleImageWithParams(File file,
                                        File destinationFile, String format) {
        try {
            BufferedImage bufferedImage = null;
            bufferedImage = ImageIO.read(file);

            int width = bufferedImage.getWidth();
            int height = bufferedImage.getHeight();
            //如果图片本来就小就不压缩了
            if (width <= CommonCons.Config_Flag.PICTURE_WIDTH && height <= CommonCons.Config_Flag.PICTURE_HEIGHT) {
                return true;
            }
            //自动按比例调整宽高
            ArrayList<Integer> paramsArrayList = getAutoWidthAndHeight(
                    bufferedImage,
                    CommonCons.Config_Flag.PICTURE_WIDTH,
                    CommonCons.Config_Flag.PICTURE_HEIGHT);
            width = paramsArrayList.get(0);
            height = paramsArrayList.get(1);
            logger.info("自动调整比例，width={} height={}", width, height);
            Image image = bufferedImage.getScaledInstance(width, height,
                    Image.SCALE_DEFAULT);
            BufferedImage outputImage = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics graphics = outputImage.getGraphics();
            graphics.drawImage(image, 0, 0, null);
            graphics.dispose();
            ImageIO.write(outputImage, format, destinationFile);
            return true;
        } catch (Exception e) {
            logger.error("scaleImageWithParams方法压缩图片时出错了");
            e.printStackTrace();
            return false;
        }


    }

    /**
     * 将double类型的数据转换为int，四舍五入原则
     *
     * @param sourceDouble
     * @return
     */
    private int parseDoubleToInt(double sourceDouble) {
        int result = 0;
        result = (int) sourceDouble;
        return result;
    }

    /***
     * @param bufferedImage 要缩放的图片对象
     * @param width_scale   要缩放到的宽度
     * @param height_scale  要缩放到的高度
     * @return 一个集合，第一个元素为宽度，第二个元素为高度
     */
    private ArrayList<Integer> getAutoWidthAndHeight(BufferedImage bufferedImage, int width_scale, int height_scale) {
        ArrayList<Integer> arrayList = new ArrayList<Integer>();
        int width = bufferedImage.getWidth();
        int height = bufferedImage.getHeight();
        double scale_w = getDot2Decimal(width_scale, width);
        double scale_h = getDot2Decimal(height_scale, height);
        if (scale_w < scale_h) {
            arrayList.add(parseDoubleToInt(scale_w * width));
            arrayList.add(parseDoubleToInt(scale_w * height));
        } else {
            arrayList.add(parseDoubleToInt(scale_h * width));
            arrayList.add(parseDoubleToInt(scale_h * height));
        }
        return arrayList;

    }


    /***
     * 返回两个数a/b的小数点后三位的表示
     *
     * @param a
     * @param b
     * @return
     */
    public double getDot2Decimal(int a, int b) {
        BigDecimal bigDecimal_1 = new BigDecimal(a);
        BigDecimal bigDecimal_2 = new BigDecimal(b);
        BigDecimal bigDecimal_result = bigDecimal_1.divide(bigDecimal_2, new MathContext(4));
        Double double1 = new Double(bigDecimal_result.toString());
        return double1;
    }


    public String getFileExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".")).replace(".", "");
    }


    /**
     * 获取图片正确显示需要旋转的角度（顺时针）
     *
     * @return
     */
    public int getRotateAngleForPhoto(File file) {
        int angle = 0;
        Metadata metadata;
        try {
            metadata = JpegMetadataReader.readMetadata(file);
            Directory directory = metadata.getDirectory(ExifDirectory.class);
            if (directory.containsTag(ExifDirectory.TAG_ORIENTATION)) {
                // Exif信息中方向　　
                int orientation = directory.getInt(ExifDirectory.TAG_ORIENTATION);

                // 原图片的方向信息
                if (6 == orientation) {
                    //6旋转90
                    angle = 90;
                } else if (3 == orientation) {
                    //3旋转180
                    angle = 180;
                } else if (8 == orientation) {
                    //8旋转90
                    angle = 270;
                }
            }
        } catch (JpegProcessingException e) {
            //e.printStackTrace();
        } catch (MetadataException e) {
            //e.printStackTrace();
        }
        return angle;
    }


    /**
     * 旋转手机照片
     *
     * @return
     */
    public void rotatePhonePhoto(File file, String type, int angel) {
        BufferedImage src;
        try {
            src = ImageIO.read(file);
            int src_width = src.getWidth(null);
            int src_height = src.getHeight(null);
            Rectangle rect_des = CalcRotatedSize(new Rectangle(new Dimension(src_width, src_height)), angel);
            BufferedImage res = new BufferedImage(rect_des.width, rect_des.height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2 = res.createGraphics();

            g2.translate((rect_des.width - src_width) / 2,
                    (rect_des.height - src_height) / 2);
            g2.rotate(Math.toRadians(angel), src_width / 2, src_height / 2);
            g2.drawImage(src, null, null);
            ImageIO.write(res, type, file);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    /**
     * 计算旋转参数
     */
    public Rectangle CalcRotatedSize(Rectangle src, int angel) {
        // if angel is greater than 90 degree,we need to do some conversion.
        if (angel > 90) {
            if (angel / 9 % 2 == 1) {
                int temp = src.height;
                src.height = src.width;
                src.width = temp;
            }
            angel = angel % 90;
        }

        double r = Math.sqrt(src.height * src.height + src.width * src.width) / 2;
        double len = 2 * Math.sin(Math.toRadians(angel) / 2) * r;
        double angel_alpha = (Math.PI - Math.toRadians(angel)) / 2;
        double angel_dalta_width = Math.atan((double) src.height / src.width);
        double angel_dalta_height = Math.atan((double) src.width / src.height);

        int len_dalta_width = (int) (len * Math.cos(Math.PI - angel_alpha
                - angel_dalta_width));
        int len_dalta_height = (int) (len * Math.cos(Math.PI - angel_alpha
                - angel_dalta_height));
        int des_width = src.width + len_dalta_width * 2;
        int des_height = src.height + len_dalta_height * 2;
        return new java.awt.Rectangle(new Dimension(des_width, des_height));
    }


}
