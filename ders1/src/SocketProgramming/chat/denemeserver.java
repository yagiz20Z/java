/*
*
*        ^
*       /^\\
*      /___\\         YILDIZ ROKET TAKIMI
*     |=   =|        
*     |     |        Olusturulma Tarihi     : 2025-05-14 00:48:37
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

public class denemeserver {
    public static void main(String[] args) {

        int port = 45000;

        try {
            ServerSocket serverSocket = new ServerSocket(port);
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
        } //try bitisi


        catch (IOException e) {
            e.printStackTrace();
        }
    }
}
