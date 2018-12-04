<%@ page
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
<%@ page import="java.io.OutputStream"%>
<%@ page pageEncoding="UTF-8"%>
<%!Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}%>
<%
		try {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		int width = 85, height = 20;
		BufferedImage image = new BufferedImage(width, height,
		BufferedImage.TYPE_INT_RGB);
		OutputStream os = response.getOutputStream();
		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.PLAIN, 20));
		g.setColor(getRandColor(120, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(5);
			int yl = random.nextInt(5);
			g.drawLine(x, y, x + xl, y + yl);
		}
		String sRand = "";
		//设置图片上验证码的位数
		for (int i = 0; i < 4; i++) {
			String chose = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			String rand = String.valueOf(chose.charAt(random
			.nextInt(chose.length())));
			sRand += rand;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
			.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 15 * i + 6, 16);
		}
		session.setAttribute("code", sRand);
		g.dispose();

		ImageIO.write(image, "JPEG", os);
		os.flush();
		os.close();
		os = null;
		response.flushBuffer();
		out.clear();
		out = pageContext.pushBody();
	} catch (IllegalStateException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
%>
