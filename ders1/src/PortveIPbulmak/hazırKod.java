    package PortveIPbulmak;

    import java.net.*;
    import java.util.*;


    // *****############### Port ve Ip Bulma ###############***** \\


    public class hazırKod {
        public static void main(String[] args) throws SocketException {


            // enumeration >> enum; // NetworkInterface ifadesi sistemdeki tüm arayüzleri sırasıyla verir

                Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
            while (interfaces.hasMoreElements()) {
                NetworkInterface iface = interfaces.nextElement();

                // Sanal ağları atla (örneğin loopback veya VPN)
                if (iface.isLoopback() || !iface.isUp())
                    continue;

                System.out.println("Interface: " + iface.getDisplayName());

                Enumeration<InetAddress> addresses = iface.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress addr = addresses.nextElement();
                    System.out.println("  Address: " + addr.getHostAddress());
                }
            }
        }
    }
