package SocketProgramming;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.rmi.ServerError;

// *****############### SERVER (ALICI)  ###############***** \\

// harflerin buyuk kucuklugune dikkat et \\

public class SOCKETserver {



    public static void main(String[] args) throws Exception {

        System.out.println("Server basladi");

        ServerSocket sgirdi = new ServerSocket(15000 );
        System.out.println("Server, client'i bekliyor");

        Socket scikti  = sgirdi.accept ();
        System.out.println("Client baglandi");

        BufferedReader br = new BufferedReader(new InputStreamReader(scikti.getInputStream()));
        String str = br.readLine();

        System.out.println("Client verisi : " + str);
    }

}