



int main(){


    int a = 0;
    int b = 1;

    for(int i = 9; i < 100; i += 4){
        a += b;
        b = (b << 1) ^ b;
    }



}
