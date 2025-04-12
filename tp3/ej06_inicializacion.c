
#define DIM 10

// de manera globar sin inicializar
int arr5[DIM];

// de manera global inicializandolo
int arr6[DIM] = {0};

int main() {
    // sin inicializar
    int arr1[DIM];

    // con inicializacion
    int arr2[DIM] = {0};
    char msg[] = "hola manola";

    // sin inicializar y lugego haciendo una escritura en el indice 10
    int arr3[20];
    arr3[10] = 1;

    // con inicializacion y luego realizando una escritura en el indice 10 y 11
    int arr4[20] = {0};
    arr4[10] = 1;
    arr4[11] = 2;


    return 0;
}