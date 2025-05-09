package PortveIPbulmak;

import java.net.*;
import java.util.*;

public class portveip {

    public static void main(String[] args) throws Exception {

        Enumeration<NetworkInterface> arayuz = NetworkInterface.getNetworkInterfaces();

        while (arayuz.hasMoreElements()) {

            NetworkInterface comp = arayuz.nextElement();
        //    if (comp.getDisplayName().equals("Realtek PCIe GbE Family Controller")) {

                System.out.println(comp.getName());
                System.out.println(comp.isUp());
   //         }


        }


    }

}

