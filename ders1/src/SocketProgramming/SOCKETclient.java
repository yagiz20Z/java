package SocketProgramming;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket; // bu kütüphane kullanılması lazım


// *****############### CLİENT (VERICI) ###############***** \\


public class SOCKETclient {
    public static void main(String[] args) throws Exception
    {

    String ip = "localhost";
    int port = 9999; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır

        Socket agirisi = new Socket (ip,port);

    String str = "Ready";

        OutputStreamWriter girdi = new OutputStreamWriter(agirisi.getOutputStream());
        PrintWriter cikti = new PrintWriter(girdi);
        girdi.write(str);



    }


}
