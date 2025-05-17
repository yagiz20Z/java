package SocketProgramming.konntrol;


import java.io.*;
import java.net.*;


public class KONTROL {
    public static void main(String[] args) throws IOException {
        try{
            String clientgelen;

            ServerSocket serverSocket = null;
            Socket clientSocket = null;

            int sayi;
            try {
                serverSocket = new ServerSocket(45000);

            } catch (Exception e) {
                System.out.println("Port hatasi");
            }
            System.out.println("Server hazir!");

            clientSocket = serverSocket.accept();

            System.out.println("Yeni istemci bağlantısı kabul edildi: " + clientSocket.getInetAddress().getHostAddress());

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

            DataParse data = new DataParse();
            while ((clientgelen = in.readLine()) != null) {
                System.out.println("gelen veri : " + clientgelen);
                data.setAll(clientgelen + '\n');
            }
            in.close();
            clientSocket.close();
            serverSocket.close();
        }
        catch (IOException e)
        {
            System.out.println("Bağlantı koptu: " + e);
        }
    }
}