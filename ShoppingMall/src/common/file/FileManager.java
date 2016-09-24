package common.file;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class FileManager {
	
	// 확장자 추출하기
	public static String getExtend(String path){
		int lastIndex = path.lastIndexOf(".");
				
		return path.substring(lastIndex+1);
	}
	
	// 썸네일 생성
	public static void makeThumb(File file, String savePath, String realname, int product_id) throws IOException{
		int xscale = 4;	// 가로비율
		int yscale = 3;	// 세로비율
		int size = 15;		// 사이즈
		int width = xscale*size;
		int height = yscale*size;
		String ext = getExtend(realname);
		BufferedImage img = ImageIO.read(file);
		Image reiszeImg = img.getScaledInstance(width, height, Image.SCALE_FAST);
		BufferedImage newImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = newImg.getGraphics();
		g.drawImage(reiszeImg, 0, 0, null);
		g.dispose();
		ImageIO.write(newImg, ext, new File(savePath+product_id+"_thumb."+ext));
	}
		
}// class
