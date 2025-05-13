package temel;

import java.util.Scanner;
//import java.util.*; // Tüm sınıfları ekler.

public class VeriAlma {

    public static void main(String[] args) {

    Scanner girdi = new Scanner(System.in);

        System.out.print("A sayısını giriniz   : ");
        int a = girdi.nextInt();
        System.out.print("\nb sayıını giriniz : ");
        int b = girdi.nextInt();

        int toplam = a + b;
        System.out.println("\n"+toplam);



    }


}
