package SocketProgramming.chat;

import java.io.*;
import java.net.*;

public class denemeclient {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 1234);

            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

            out.write("Merhaba sunucu!\n");
            out.flush(); // veriyi gerçekten gönder

            socket.close(); // bağlantıyı düzgün şekilde kapat
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
