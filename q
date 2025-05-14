[33mcommit eb24c0464aedac91fe7d4826f4ccaf614fa6a208[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m, [m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: Ali Yağız Uz <aliyagizuz@gmail.com>
Date:   Wed May 14 00:56:58 2025 +0300

    socket programming kısmına dogrusunu ekledim ve try-cacth dosyasını ekledim ki calisayım

[1mdiff --git a/ders1/src/SocketProgramming/SOCKETclient.java b/ders1/src/SocketProgramming/SOCKETclient.java[m
[1mindex 2a33b9e..7178154 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETclient.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETclient.java[m
[36m@@ -11,11 +11,11 @@[m [mimport java.net.Socket; // bu kütüphane kullanılması lazım[m
 public class SOCKETclient {[m
     public static void main(String[] args) throws Exception[m
     {[m
[31m-[m
[31m-        String ip = "172.15.3.74";[m
[31m-        int port = 15000; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır[m
[31m-[m
[31m-        Socket agirisi = new Socket (ip,port);[m
[32m+[m[32m    // 172.15.3.74[m
[32m+[m[32m       // String ip = "localhost";[m
[32m+[m[32m        int port; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali portlar 1023-65535 arasındadır[m
[32m+[m[32m            port = 45000;[m
[32m+[m[32m        Socket agirisi = new Socket ("localhost",port);[m
 [m
         String str = "Ready";[m
 [m
[36m@@ -23,8 +23,6 @@[m [mpublic class SOCKETclient {[m
         PrintWriter cikti = new PrintWriter(girdi);[m
         girdi.write(str);[m
 [m
[31m-[m
[31m-[m
     }[m
 [m
 [m
[1mdiff --git a/ders1/src/SocketProgramming/SOCKETserver.java b/ders1/src/SocketProgramming/SOCKETserver.java[m
[1mindex 9f772e8..749ddf9 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETserver.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETserver.java[m
[36m@@ -1,8 +1,8 @@[m
 package SocketProgramming;[m
[31m-import java.io.BufferedReader;[m
[31m-import java.io.InputStreamReader;[m
[31m-import java.net.ServerSocket;[m
[31m-import java.net.Socket;[m
[32m+[m
[32m+[m[32mimport java.io.*;[m
[32m+[m
[32m+[m[32mimport java.net.*;[m
 import java.rmi.ServerError;[m
 [m
 // *****############### SERVER (ALICI)  ###############***** \\[m
[36m@@ -17,7 +17,7 @@[m [mpublic class SOCKETserver {[m
 [m
         System.out.println("Server basladi");[m
 [m
[31m-        ServerSocket sgirdi = new ServerSocket(15000 );[m
[32m+[m[32m        ServerSocket sgirdi = new ServerSocket(45000 );[m
         System.out.println("Server, client'i bekliyor");[m
 [m
         Socket scikti  = sgirdi.accept ();[m
[36m@@ -27,6 +27,20 @@[m [mpublic class SOCKETserver {[m
         String str = br.readLine();[m
 [m
         System.out.println("Client verisi : " + str);[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
     }[m
 [m
 }[m
\ No newline at end of file[m
[1mdiff --git a/ders1/src/SocketProgramming/chat/denemeclient.java b/ders1/src/SocketProgramming/chat/denemeclient.java[m
[1mnew file mode 100644[m
[1mindex 0000000..5effd54[m
[1m--- /dev/null[m
[1m+++ b/ders1/src/SocketProgramming/chat/denemeclient.java[m
[36m@@ -0,0 +1,21 @@[m
[32m+[m[32mpackage SocketProgramming.chat;[m
[32m+[m
[32m+[m[32mimport java.io.*;[m
[32m+[m[32mimport java.net.*;[m
[32m+[m
[32m+[m[32mpublic class denemeclient {[m
[32m+[m[32m    public static void main(String[] args) {[m
[32m+[m[32m        try {[m
[32m+[m[32m            Socket socket = new Socket("localhost", 1234);[m
[32m+[m
[32m+[m[32m            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));[m
[32m+[m
[32m+[m[32m            out.write("Merhaba sunucu!\n");[m
[32m+[m[32m            out.flush(); // veriyi gerçekten gönder[m
[32m+[m
[32m+[m[32m            socket.close(); // bağlantıyı düzgün şekilde kapat[m
[32m+[m[32m        } catch (IOException e) {[m
[32m+[m[32m            e.printStackTrace();[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/ders1/src/SocketProgramming/chat/denemeserver.java b/ders1/src/SocketProgramming/chat/denemeserver.java[m
[1mnew file mode 100644[m
[1mindex 0000000..801d9ce[m
[1m--- /dev/null[m
[1m+++ b/ders1/src/SocketProgramming/chat/denemeserver.java[m
[36m@@ -0,0 +1,30 @@[m
[32m+[m[32mpackage SocketProgramming.chat;[m
[32m+[m
[32m+[m[32mimport java.io.*;[m
[32m+[m[32mimport java.net.*;[m
[32m+[m
[32m+[m[32mpublic class denemeserver {[m
[32m+[m[32m    public static void main(String[] args) {[m
[32m+[m[32m        try {[m
[32m+[m[32m            ServerSocket serverSocket = new ServerSocket(1234);[m
[32m+[m[32m            System.out.println("Server basladi");[m
[32m+[m[32m            System.out.println("Server, client'i bekliyor");[m
[32m+[m
[32m+[m[32m            Socket clientSocket = serverSocket.accept();[m
[32m+[m[32m            System.out.println("Client baglandi");[m
[32m+[m
[32m+[m[32m            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));[m
[32m+[m
[32m+[m[32m            String line;[m
[32m+[m[32m            while ((line = in.readLine()) != null) {[m
[32m+[m[32m                System.out.println("Client'tan gelen veri: " + line);[m
[32m+[m[32m            }[m
[32m+[m
[32m+[m[32m            in.close();[m
[32m+[m[32m            clientSocket.close();[m
[32m+[m[32m            serverSocket.close();[m
[32m+[m[32m        } catch (IOException e) {[m
[32m+[m[32m            e.printStackTrace();[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/ders1/src/TryCatch/ttry.java b/ders1/src/TryCatch/ttry.java[m
[1mnew file mode 100644[m
[1mindex 0000000..8c172bc[m
[1m--- /dev/null[m
[1m+++ b/ders1/src/TryCatch/ttry.java[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32mpackage TryCatch;[m
[32m+[m
[32m+[m
[32m+[m[32mpublic class ttry {[m
[32m+[m[32m    public static void main(String[] args){[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/ders1/src/ForDongu.java b/ders1/src/temel/ForDongu.java[m
[1msimilarity index 91%[m
[1mrename from ders1/src/ForDongu.java[m
[1mrename to ders1/src/temel/ForDongu.java[m
[1mindex 5c9702e..15544c8 100644[m
[1m--- a/ders1/src/ForDongu.java[m
[1m+++ b/ders1/src/temel/ForDongu.java[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32mpackage temel;[m
[32m+[m
 public class ForDongu {[m
     public static void main(String[] args){[m
         int i;[m
[1mdiff --git a/ders1/src/HelloWorld.java b/ders1/src/temel/HelloWorld.java[m
[1msimilarity index 97%[m
[1mrename from ders1/src/HelloWorld.java[m
[1mrename to ders1/src/temel/HelloWorld.java[m
[1mindex fdba17c..83f14e2 100644[m
[1m--- a/ders1/src/HelloWorld.java[m
[1m+++ b/ders1/src/temel/HelloWorld.java[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32mpackage temel;[m
[32m+[m
 public class HelloWorld {[m
 [m
     public static void main(String[] args) {[m
[1mdiff --git a/ders1/src/Main.java b/ders1/src/temel/Main.java[m
[1msimilarity index 93%[m
[1mrename from ders1/src/Main.java[m
[1mrename to ders1/src/temel/Main.java[m
[1mindex 27f51ba..d1902c2 100644[m
[1m--- a/ders1/src/Main.java[m
[1m+++ b/ders1/src/temel/Main.java[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32mpackage temel;[m
[32m+[m
 //[m
 public class Main {[m
     public static void main(String[] args) {[m
[1mdiff --git a/ders1/src/VeriAlma.java b/ders1/src/temel/VeriAlma.java[m
[1msimilarity index 96%[m
[1mrename from ders1/src/VeriAlma.java[m
[1mrename to ders1/src/temel/VeriAlma.java[m
[1mindex 99c5d04..cbd52e4 100644[m
[1m--- a/ders1/src/VeriAlma.java[m
[1m+++ b/ders1/src/temel/VeriAlma.java[m
[36m@@ -1,3 +1,5 @@[m
[32m+[m[32mpackage temel;[m
[32m+[m
 import java.util.Scanner;[m
 //import java.util.*; // Tüm sınıfları ekler.[m
 [m

[33mcommit e3beaca6f715881d4190869749fb4c374cae6f57[m
Author: Ali Yağız Uz <aliyagizuz@gmail.com>
Date:   Sat May 10 16:54:21 2025 +0300

    asd

[1mdiff --git a/ders1/.idea/misc.xml b/ders1/.idea/misc.xml[m
[1mindex a9182a4..4e28b13 100644[m
[1m--- a/ders1/.idea/misc.xml[m
[1m+++ b/ders1/.idea/misc.xml[m
[36m@@ -1,6 +1,6 @@[m
 <?xml version="1.0" encoding="UTF-8"?>[m
 <project version="4">[m
[31m-  <component name="ProjectRootManager" version="2" languageLevel="JDK_24" default="true" project-jdk-name="openjdk-24" project-jdk-type="JavaSDK">[m
[32m+[m[32m  <component name="ProjectRootManager" version="2" languageLevel="JDK_24" default="true" project-jdk-name="openjdk-24 (2)" project-jdk-type="JavaSDK">[m
     <output url="file://$PROJECT_DIR$/out" />[m
   </component>[m
 </project>[m
\ No newline at end of file[m
[1mdiff --git a/ders1/src/SocketProgramming/SOCKETclient.java b/ders1/src/SocketProgramming/SOCKETclient.java[m
[1mindex 559d8b5..2a33b9e 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETclient.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETclient.java[m
[36m@@ -12,12 +12,12 @@[m [mpublic class SOCKETclient {[m
     public static void main(String[] args) throws Exception[m
     {[m
 [m
[31m-    String ip = "localhost";[m
[31m-    int port = 9999; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır[m
[32m+[m[32m        String ip = "172.15.3.74";[m
[32m+[m[32m        int port = 15000; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır[m
 [m
         Socket agirisi = new Socket (ip,port);[m
 [m
[31m-    String str = "Ready";[m
[32m+[m[32m        String str = "Ready";[m
 [m
         OutputStreamWriter girdi = new OutputStreamWriter(agirisi.getOutputStream());[m
         PrintWriter cikti = new PrintWriter(girdi);[m
[36m@@ -28,4 +28,4 @@[m [mpublic class SOCKETclient {[m
     }[m
 [m
 [m
[31m-}[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/ders1/src/SocketProgramming/SOCKETserver.java b/ders1/src/SocketProgramming/SOCKETserver.java[m
[1mindex 4172c39..9f772e8 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETserver.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETserver.java[m
[36m@@ -17,17 +17,16 @@[m [mpublic class SOCKETserver {[m
 [m
         System.out.println("Server basladi");[m
 [m
[31m-        ServerSocket sgirdi = new ServerSocket(9999 );[m
[32m+[m[32m        ServerSocket sgirdi = new ServerSocket(15000 );[m
         System.out.println("Server, client'i bekliyor");[m
 [m
         Socket scikti  = sgirdi.accept ();[m
         System.out.println("Client baglandi");[m
 [m
[31m-[m
         BufferedReader br = new BufferedReader(new InputStreamReader(scikti.getInputStream()));[m
         String str = br.readLine();[m
 [m
         System.out.println("Client verisi : " + str);[m
     }[m
 [m
[31m-}[m
[32m+[m[32m}[m
\ No newline at end of file[m

[33mcommit 559358cd3154c1f071d19b5946364f8580ff37f1[m
Author: Ali Yağız Uz <aliyagizuz@gmail.com>
Date:   Fri May 9 22:08:47 2025 +0300

    a

[1mdiff --git "a/ders1/src/PortveIPbulmak/haz\304\261rKod.java" "b/ders1/src/PortveIPbulmak/haz\304\261rKod.java"[m
[1mindex e0a6c58..c379966 100644[m
[1m--- "a/ders1/src/PortveIPbulmak/haz\304\261rKod.java"[m
[1m+++ "b/ders1/src/PortveIPbulmak/haz\304\261rKod.java"[m
[36m@@ -1,33 +1,33 @@[m
[31m-package PortveIPbulmak;[m
[32m+[m[32m    package PortveIPbulmak;[m
 [m
[31m-import java.net.*;[m
[31m-import java.util.*;[m
[32m+[m[32m    import java.net.*;[m
[32m+[m[32m    import java.util.*;[m
 [m
 [m
[31m-// *****############### Port ve Ip Bulma ###############***** \\[m
[32m+[m[32m    // *****############### Port ve Ip Bulma ###############***** \\[m
 [m
 [m
[31m-public class hazırKod {[m
[31m-    public static void main(String[] args) throws SocketException {[m
[32m+[m[32m    public class hazırKod {[m
[32m+[m[32m        public static void main(String[] args) throws SocketException {[m
 [m
 [m
[31m-        // enumeration >> enum; // NetworkInterface ifadesi sistemdeki tüm arayüzleri sırasıyla verir[m
[32m+[m[32m            // enumeration >> enum; // NetworkInterface ifadesi sistemdeki tüm arayüzleri sırasıyla verir[m
 [m
[31m-            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();[m
[31m-        while (interfaces.hasMoreElements()) {[m
[31m-            NetworkInterface iface = interfaces.nextElement();[m
[32m+[m[32m                Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();[m
[32m+[m[32m            while (interfaces.hasMoreElements()) {[m
[32m+[m[32m                NetworkInterface iface = interfaces.nextElement();[m
 [m
[31m-            // Sanal ağları atla (örneğin loopback veya VPN)[m
[31m-            if (iface.isLoopback() || !iface.isUp())[m
[31m-                continue;[m
[32m+[m[32m                // Sanal ağları atla (örneğin loopback veya VPN)[m
[32m+[m[32m                if (iface.isLoopback() || !iface.isUp())[m
[32m+[m[32m                    continue;[m
 [m
[31m-            System.out.println("Interface: " + iface.getDisplayName());[m
[32m+[m[32m                System.out.println("Interface: " + iface.getDisplayName());[m
 [m
[31m-            Enumeration<InetAddress> addresses = iface.getInetAddresses();[m
[31m-            while (addresses.hasMoreElements()) {[m
[31m-                InetAddress addr = addresses.nextElement();[m
[31m-                System.out.println("  Address: " + addr.getHostAddress());[m
[32m+[m[32m                Enumeration<InetAddress> addresses = iface.getInetAddresses();[m
[32m+[m[32m                while (addresses.hasMoreElements()) {[m
[32m+[m[32m                    InetAddress addr = addresses.nextElement();[m
[32m+[m[32m                    System.out.println("  Address: " + addr.getHostAddress());[m
[32m+[m[32m                }[m
             }[m
         }[m
     }[m
[31m-}[m
[1mdiff --git a/ders1/src/PortveIPbulmak/portveip.java b/ders1/src/PortveIPbulmak/portveip.java[m
[1mindex 1981e75..f3c9672 100644[m
[1m--- a/ders1/src/PortveIPbulmak/portveip.java[m
[1m+++ b/ders1/src/PortveIPbulmak/portveip.java[m
[36m@@ -5,32 +5,24 @@[m [mimport java.util.*;[m
 [m
 public class portveip {[m
 [m
[31m-    public static void main (String[] args) throws Exception{[m
[32m+[m[32m    public static void main(String[] args) throws Exception {[m
 [m
         Enumeration<NetworkInterface> arayuz = NetworkInterface.getNetworkInterfaces();[m
 [m
[31m-        while (arayuz.hasMoreElements()){[m
[32m+[m[32m        while (arayuz.hasMoreElements()) {[m
 [m
             NetworkInterface comp = arayuz.nextElement();[m
[31m-[m
[31m-            if (comp.getDisplayName().equals("Realtek PCIe GbE Family Controller")){[m
[32m+[m[32m        //    if (comp.getDisplayName().equals("Realtek PCIe GbE Family Controller")) {[m
 [m
                 System.out.println(comp.getName());[m
[31m-[m
[31m-            }[m
[31m-[m
[31m-[m
[31m-[m
[31m-[m
[32m+[m[32m                System.out.println(comp.isUp());[m
[32m+[m[32m   //         }[m
 [m
 [m
         }[m
 [m
 [m
[31m-[m
[31m-[m
[31m-[m
     }[m
 [m
[31m-[m
 }[m
[41m+[m
[1mdiff --git a/ders1/src/SocketProgramming/SOCKETclient.java b/ders1/src/SocketProgramming/SOCKETclient.java[m
[1mindex 169187b..559d8b5 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETclient.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETclient.java[m
[36m@@ -5,7 +5,7 @@[m [mimport java.io.PrintWriter;[m
 import java.net.Socket; // bu kütüphane kullanılması lazım[m
 [m
 [m
[31m-// *****############### CLİENT ###############***** \\[m
[32m+[m[32m// *****############### CLİENT (VERICI) ###############***** \\[m
 [m
 [m
 public class SOCKETclient {[m
[36m@@ -13,7 +13,7 @@[m [mpublic class SOCKETclient {[m
     {[m
 [m
     String ip = "localhost";[m
[31m-    int port = 32769; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır[m
[32m+[m[32m    int port = 9999; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır[m
 [m
         Socket agirisi = new Socket (ip,port);[m
 [m
[1mdiff --git a/ders1/src/SocketProgramming/SOCKETserver.java b/ders1/src/SocketProgramming/SOCKETserver.java[m
[1mindex 9d8e6b5..4172c39 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETserver.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETserver.java[m
[36m@@ -5,7 +5,7 @@[m [mimport java.net.ServerSocket;[m
 import java.net.Socket;[m
 import java.rmi.ServerError;[m
 [m
[31m-// *****############### SERVER ###############***** \\[m
[32m+[m[32m// *****############### SERVER (ALICI)  ###############***** \\[m
 [m
 // harflerin buyuk kucuklugune dikkat et \\[m
 [m
[36m@@ -16,11 +16,11 @@[m [mpublic class SOCKETserver {[m
     public static void main(String[] args) throws Exception {[m
 [m
         System.out.println("Server basladi");[m
[31m-        ServerSocket sgirdi = new ServerSocket(8080 );[m
 [m
[32m+[m[32m        ServerSocket sgirdi = new ServerSocket(9999 );[m
         System.out.println("Server, client'i bekliyor");[m
[31m-        Socket scikti  = sgirdi.accept ();[m
 [m
[32m+[m[32m        Socket scikti  = sgirdi.accept ();[m
         System.out.println("Client baglandi");[m
 [m
 [m

[33mcommit 5c0d7468ff1b40568182e43f2650aa1d8a113454[m
Author: Ali Yağız Uz <aliyagizuz@gmail.com>
Date:   Fri May 9 20:22:21 2025 +0300

    port ip bulma ekledim

[1mdiff --git "a/ders1/src/PortveIPbulmak/haz\304\261rKod.java" "b/ders1/src/PortveIPbulmak/haz\304\261rKod.java"[m
[1mnew file mode 100644[m
[1mindex 0000000..e0a6c58[m
[1m--- /dev/null[m
[1m+++ "b/ders1/src/PortveIPbulmak/haz\304\261rKod.java"[m
[36m@@ -0,0 +1,33 @@[m
[32m+[m[32mpackage PortveIPbulmak;[m
[32m+[m
[32m+[m[32mimport java.net.*;[m
[32m+[m[32mimport java.util.*;[m
[32m+[m
[32m+[m
[32m+[m[32m// *****############### Port ve Ip Bulma ###############***** \\[m
[32m+[m
[32m+[m
[32m+[m[32mpublic class hazırKod {[m
[32m+[m[32m    public static void main(String[] args) throws SocketException {[m
[32m+[m
[32m+[m
[32m+[m[32m        // enumeration >> enum; // NetworkInterface ifadesi sistemdeki tüm arayüzleri sırasıyla verir[m
[32m+[m
[32m+[m[32m            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();[m
[32m+[m[32m        while (interfaces.hasMoreElements()) {[m
[32m+[m[32m            NetworkInterface iface = interfaces.nextElement();[m
[32m+[m
[32m+[m[32m            // Sanal ağları atla (örneğin loopback veya VPN)[m
[32m+[m[32m            if (iface.isLoopback() || !iface.isUp())[m
[32m+[m[32m                continue;[m
[32m+[m
[32m+[m[32m            System.out.println("Interface: " + iface.getDisplayName());[m
[32m+[m
[32m+[m[32m            Enumeration<InetAddress> addresses = iface.getInetAddresses();[m
[32m+[m[32m            while (addresses.hasMoreElements()) {[m
[32m+[m[32m                InetAddress addr = addresses.nextElement();[m
[32m+[m[32m                System.out.println("  Address: " + addr.getHostAddress());[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/ders1/src/PortveIPbulmak/portveip.java b/ders1/src/PortveIPbulmak/portveip.java[m
[1mnew file mode 100644[m
[1mindex 0000000..1981e75[m
[1m--- /dev/null[m
[1m+++ b/ders1/src/PortveIPbulmak/portveip.java[m
[36m@@ -0,0 +1,36 @@[m
[32m+[m[32mpackage PortveIPbulmak;[m
[32m+[m
[32m+[m[32mimport java.net.*;[m
[32m+[m[32mimport java.util.*;[m
[32m+[m
[32m+[m[32mpublic class portveip {[m
[32m+[m
[32m+[m[32m    public static void main (String[] args) throws Exception{[m
[32m+[m
[32m+[m[32m        Enumeration<NetworkInterface> arayuz = NetworkInterface.getNetworkInterfaces();[m
[32m+[m
[32m+[m[32m        while (arayuz.hasMoreElements()){[m
[32m+[m
[32m+[m[32m            NetworkInterface comp = arayuz.nextElement();[m
[32m+[m
[32m+[m[32m            if (comp.getDisplayName().equals("Realtek PCIe GbE Family Controller")){[m
[32m+[m
[32m+[m[32m                System.out.println(comp.getName());[m
[32m+[m
[32m+[m[32m            }[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/ders1/src/SocketProgramming/SOCKETclient.java b/ders1/src/SocketProgramming/SOCKETclient.java[m
[1mindex 579b99a..169187b 100644[m
[1m--- a/ders1/src/SocketProgramming/SOCKETclient.java[m
[1m+++ b/ders1/src/SocketProgramming/SOCKETclient.java[m
[36m@@ -5,7 +5,7 @@[m [mimport java.io.PrintWriter;[m
 import java.net.Socket; // bu kütüphane kullanılması lazım[m
 [m
 [m
[31m-// *****############### CLİENT ###############***** //[m
[32m+[m[32m// *****############### CLİENT ###############***** \\[m
 [m
 [m
 public class SOCKETclient {[m
[36m@@ -13,7 +13,7 @@[m [mpublic class SOCKETclient {[m
     {[m
 [m
     String ip = "localhost";[m
[31m-    int port = 8080; // 0-65535[m
[32m+[m[32m    int port = 32769; // 0-65535 // ama 0-1023 arasındaki portlar sistem için özel olarak ayrılmış durumdadır // ideali porlar 1023-65535 arasındadır[m
 [m
         Socket agirisi = new Socket (ip,port);[m
 [m
[36m@@ -24,6 +24,7 @@[m [mpublic class SOCKETclient {[m
         girdi.write(str);[m
 [m
 [m
[32m+[m
     }[m
 [m
 [m

[33mcommit fe32b9b84e1e4c94bdeb56c0adb5f83c2dabb743[m
Author: Ali Yağız Uz <aliyagizuz@gmail.com>
Date:   Fri May 9 18:23:57 2025 +0300

    dosya yolu ekledim

[1mdiff --git a/yol.txt b/yol.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..6b6a679[m
[1m--- /dev/null[m
[1m+++ b/yol.txt[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32m"C:\Users\Ali Ya��z UZ\IdeaProjects\GitJavaRepo"[m[41m [m
