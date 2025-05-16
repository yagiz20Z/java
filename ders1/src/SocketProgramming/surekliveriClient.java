/*
*
*        ^
*       /^\\
*      /___\\         YILDIZ ROKET TAKIMI
*     |=   =|        
*     |     |        Olusturulma Tarihi     : 2025-05-16 16:23:10
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

import java.io.*;
import java.net.*;

public class surekliveriClient {
    public static void main(String[] args) throws IOException, InterruptedException {
        final String SERVER_IP = "localhost";
        final int PORT = 45000;
        final int INTERVAL_MS = 1000; // 1 saniye aralık (STM32'nin hızına göre ayarlayın)

        try (Socket socket = new Socket(SERVER_IP, PORT);
             PrintWriter out = new PrintWriter(socket.getOutputStream(), true)) {

            System.out.println("Server'a bağlandı. Veri gönderimi başlıyor...");

            // Sonsuz döngü (Ctrl+C ile durdurulabilir)
            int counter = 0;
            while (true) {
                // Örnek veri (STM32'den gelen veriyi simüle ediyoruz)
                String simulatedData = "STM32_VERI_" + counter + "|SICAKLIK:25.5|NEM:%60";

                out.println(simulatedData); // \n otomatik eklenir
                System.out.println("Gönderilen: " + simulatedData);

                counter++;
                Thread.sleep(INTERVAL_MS); // Belirtilen aralıkta gönderim
            }
        }
    }
}