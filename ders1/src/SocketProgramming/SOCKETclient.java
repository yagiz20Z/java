package SocketProgramming;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket; // bu kütüphane kullanılması lazım


// *****############### CLİENT ###############***** //


public class SOCKETclient {
    public static void main(String[] args) throws Exception
    {

    String ip = "localhost";
    int port = 8080; // 0-65535

        Socket agirisi = new Socket (ip,port);

    String str = "Ready";

        OutputStreamWriter girdi = new OutputStreamWriter(agirisi.getOutputStream());
        PrintWriter cikti = new PrintWriter(girdi);
        girdi.write(str);


    }


}
