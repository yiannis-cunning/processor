



static char arr[31] = "Hello World from inside a arr";

int _start(){


    int a = 0;
    int b = 1;

    for(int i = 9; i < 13; i += 4){
        a += b;
        b = (b << 1) ^ b;

        arr[i & 0x1F] = (char) (b & 0xff);
    }

    return a + b; //printf("a = %d, b = %d\n");

}
