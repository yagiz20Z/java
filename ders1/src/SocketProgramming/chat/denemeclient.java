/*
*
*        ^
*       /^\\
*      /___\\         YILDIZ ROKET TAKIMI
*     |=   =|        
*     |     |        Olusturulma Tarihi     : 2025-05-14 00:48:48
*     |     |        Son Guncellenme Tarihi : 2025-05-16 16:30:11
*     |     |
*    /|##!##|\\
*   / |##!##| \\
*  /  |##!##|  \\
* |  / ^ | ^ \  |                                       YILDIZDAN
* | /  ( | )  \ |
* |/   ( | )   \|                                                                YILDIZLARA
*     ((   ))                                                                       
*    ((  :  ))
*    ((  :  ))
*     ((   ))
*      (( ))                     
*       ( )
*        
*
* ************************************************************************************
*/

package SocketProgramming.chat;

import java.io.*;
import java.net.*;

public class denemeclient {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 45000);

            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

            out.write("Merhaba sunucu!\n");
            out.flush(); // veriyi gerçekten gönder

            socket.close(); // bağlantıyı düzgün şekilde kapat
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
