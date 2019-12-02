public class Arr {
    public static void main(String[] args) {
      int[] a = new int[10];
      for (int i=0; i<=10; i++) { //at compile time arrays dont know how long they're supposed to be 
        a[i] = i;
      }
    }
  }
  
  //$ java Arr
  //Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: 10
  //	at Arr.main(Arr.java:5)
  