<%@ page import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
<%@ page import="java.io.OutputStream" %>
<%@ page pageEncoding="UTF-8" %>
<%!
    Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

        int width = 85
                ,
                height = 20
                ,
                codeLength = 4;
%>
<%
    try {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        //生成内存图片
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        //生成可绘制的图片
        Graphics g = image.getGraphics();
        //设置矩形填充颜色 g.setColor(Color.WHITE);�С
        g.setColor(getRandColor(200, 250));

        //填充矩形
        g.fillRect(0, 0, width, height);
        //�����������ɫ
        //g.setFont(new Font("Times New Roman", Font.PLAIN, 20));
        //设置文字颜色
        g.setColor(getRandColor(120, 200));
        Random random = new Random();
        for (int i = 0; i < 55; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(5);
            int yl = random.nextInt(5);
            g.drawLine(x, y, x + xl, y + yl);
        }

        String sRand = "";
        for (int i = 0; i < codeLength; i++) {
            String chose = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            String rand = String.valueOf(chose.charAt(random.nextInt(chose.length())));
            sRand += rand;
            g.setColor(new Color(20 + random.nextInt(110), 20 + random
                    .nextInt(110), 20 + random.nextInt(110)));
            //随机设置字体大小
            Double size = Math.random() * 5 + (height - 5);
            g.setFont(new Font("Times New Roman", Font.BOLD, size.intValue()));

            g.drawString(rand, 15 * i + 6, 16);
        }
        //System.out.println(sRand);
        session.setAttribute("randCode", sRand);
        g.dispose();

        OutputStream os = response.getOutputStream();
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