package TryCatch;


public class ttry {
    public static void main(String[] args){

    try{
            // code that may cause an exception
            int deger = Integer.parseInt("6"); // parseInt =
            System.out.println(deger);
    }
    catch(NumberFormatException nfe){
            // code that we want to execute if this type of exception
            System.out.println("yapaman bunu kardas");


    }






    }

}
