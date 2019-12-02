int main(int argc, char** argv) {
  int a[10];
  for (int i=0; i<=10; i++) { // bug <= 
    a[i] = i;
  }
}


