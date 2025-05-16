/*
*
*        ^
*       /^\\
*      /___\\         YILDIZ ROKET TAKIMI
*     |=   =|        
*     |     |        Olusturulma Tarihi     : 2025-05-16 12:09:35
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

package SocketProgramming.chat.deepseekkod;

import java.io.*;
import java.net.*;

public class hazirKod {
    private static final int PORT = 45000;
    private static final int BUFFER_SIZE = 1024;
    private static final int TIMEOUT = 30000; // 30 saniye

    public static void main(String[] args) {
        ServerSocket SSOKET = null;               // bilmiyorum neden yazıldı

        try {
            SSOKET = new ServerSocket(PORT);
            SSOKET.setSoTimeout(TIMEOUT); // Bağlantı bekleme timeout'u       //?
            System.out.println("Server başlatıldı, port: " + PORT);

            while (true) {
                try (Socket clientSocket = SSOKET.accept();
                     InputStream in = clientSocket.getInputStream();
                     BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {

                    System.out.println("Client bağlandı: " + clientSocket.getInetAddress());
                    clientSocket.setSoTimeout(TIMEOUT); // Veri bekleme timeout'u

                    String line;
                    while ((line = reader.readLine()) != null) {
                        System.out.println("Alınan veri: " + line);
                        // Veri işleme kodları buraya
                    }

                }
                catch (SocketTimeoutException e) {
                    System.out.println("Timeout: Client'tan veri alınamadı");
                }
                catch (IOException e) {
                    System.err.println("Client iletişim hatası: " + e.getMessage());
                }
                System.out.println("Client bağlantısı sonlandı, yeni bağlantı bekleniyor...");
            }

        } catch (IOException e) {
            System.err.println("Server hatası: " + e.getMessage());
        } finally {
            if (SSOKET != null) {
                try {
                    SSOKET.close();
                } catch (IOException e) {
                    System.err.println("Server socket kapatılırken hata: " + e.getMessage());
                }
            }
        }
    }
}