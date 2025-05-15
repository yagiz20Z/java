/*
*
*        ^
*       /^\\
*      /___\\         YILDIZ ROKET TAKIMI
*     |=   =|        
*     |     |        Olusturulma Tarihi: 2025-05-14 00:48:37
*     |     |        Tarih             : 2025-05-15 11:15:53
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
*        .
*      .. ..
*    .........
* ... ...... ....
* ************************************************************************************
*/

package SocketProgramming.chat;

import java.io.*;
import java.net.*;

public class denemeserver {
    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(45000);
            System.out.println("Server basladi");
            System.out.println("Server, client'i bekliyor");

            Socket clientSocket = serverSocket.accept();
            System.out.println("Client baglandi");

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));


            //*************** asıl önemli kısım ***************\\
            String line;
            while ((line = in.readLine()) != null) {
                System.out.println("Client'tan gelen veri: " + line);
            }
            //*********************************\\
            in.close();
            clientSocket.close();
            serverSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
