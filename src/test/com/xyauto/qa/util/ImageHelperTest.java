//package com.xyauto.qa.util;
//
//import com.mcp.fastcloud.util.Result;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.io.DataInputStream;
//import java.io.DataOutputStream;
//import java.io.File;
//import java.io.IOException;
//import java.net.ServerSocket;
//import java.net.Socket;
//import java.util.Date;
//
//import static org.junit.Assert.*;
//
///**
// * Created by shiqm on 2017/3/20.
// */
//
//public class ImageHelperTest {
//
//
//
//
//    public static final int PORT = 60000;//监听的端口号
//
//    @Test
//    public void test() throws IOException {
//
//
//        try {
//            ServerSocket serverSocket = new ServerSocket(PORT);
//            while (true) {
//                // 一旦有堵塞, 则表示服务器与客户端获得了连接
//                Socket client = serverSocket.accept();
//                // 处理这次连接
//                new HandlerThread(client);
//            }
//        } catch (Exception e) {
//            System.out.println("服务器异常: " + e.getMessage());
//        }
//    }
//
//    private class HandlerThread implements Runnable {
//        private Socket socket;
//
//        public HandlerThread(Socket client) {
//            socket = client;
//            System.out.println("=========================================");
//            System.out.println("locketSocket:"+socket.getLocalAddress().getHostName()+":"+socket.getLocalPort());
//            System.out.println("socket:"+socket.getInetAddress().getHostName()+":"+socket.getPort()+"");
//            new Thread(this).start();
//        }
//
//        public void run() {
//            try {
//                // 读取客户端数据
//                DataInputStream input = new DataInputStream(socket.getInputStream());
//                String clientInputStr = input.readUTF();//这里要注意和客户端输出流的写方法对应,否则会抛 EOFException
//                // 处理客户端数据
//                System.out.println("客户端发过来的内容:" + clientInputStr);
//                // 向客户端回复信息
//                DataOutputStream out = new DataOutputStream(socket.getOutputStream());
//                // 发送键盘输入的一行
//                String s = "aaaaa";
//                out.writeUTF(s);
//                out.writeUTF("ccccc");
//                while (true){
//                    int count = 0;
//                    while (count == 0) {
//                        count = input.available();
//                    }
//                    clientInputStr = input.readUTF();//这里要注意和客户端输出流的写方法对应,否则会抛 EOFException
//                    // 处理客户端数据
//                    System.out.println("客户端发过来的内容:" + clientInputStr);
//                    if(clientInputStr.equals("OK")){
//                        break;
//                    }
//                }
//
//                out.close();
//                input.close();
//            } catch (Exception e) {
//                System.out.println("服务器 run 异常: " + e.getMessage());
//            } finally {
//                if (socket != null) {
//                    try {
//                        socket.close();
//                    } catch (Exception e) {
//                        socket = null;
//                        System.out.println("服务端 finally 异常:" + e.getMessage());
//                    }
//                }
//            }
//        }
//    }
//}