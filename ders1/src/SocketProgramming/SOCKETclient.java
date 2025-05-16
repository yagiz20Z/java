/*
*
*        ^
*       /^\\
*      /___\\         YILDIZ ROKET TAKIMI
*     |=   =|        
*     |     |        Olusturulma Tarihi     : 2025-05-08 11:59:48
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

package SocketProgramming;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket; // bu kütüphane kullanılması lazım


// *****############### CLİENT (VERICI) ###############***** \\


public class SOCKETclient {
    public static void main(String[] args) throws Exception
    {
    // 172.15.3.74
       // String ip = "localhost";
        int port; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali portlar 1023-65535 arasındadır
            port = 45000;
        Socket agirisi = new Socket ("localhost",port);

        String str = "Ready";

        OutputStreamWriter girdi = new OutputStreamWriter(agirisi.getOutputStream());
        PrintWriter cikti = new PrintWriter(girdi);
        girdi.write(str);
        cikti.flush();

    }


}