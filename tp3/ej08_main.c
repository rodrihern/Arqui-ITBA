void exit(int error_code);
unsigned int read(int fd, void *buf, unsigned int count);
unsigned int write(int fd, void *buf, unsigned int count);
int open(const char *pathname, int flags);
int close(int fd);

#define READ_ONLY 0
#define BUFFER_SIZE 1024
#define STDOUT 1
#define PATH "./hola.txt"

// TODO: hacerlo yo 

int main() {
    char buffer[BUFFER_SIZE];
    int fd;
    unsigned int bytes_read;

    // abrimos el amigo
    fd = open(PATH, READ_ONLY);
    if (fd < 0) {
        char error_msg[] = "Error opening file\n";
        write(STDOUT, error_msg, sizeof(error_msg) - 1);
        exit(1);
    }

    // por si no entra en el buff
    while (bytes_read = read(fd, buffer, BUFFER_SIZE)) { // por si no entra en el buff
        // hacemos una sliding window
        int i = 0;
        while (i < bytes_read) {
            int j = i;
            while (j < bytes_read && buffer[j] != '\n') {
                j++;
            }
            write(STDOUT, buffer+i, j-i);
            
            // ya esta escrita la linea, ahora a escribir el numero
            write(STDOUT, " [1]\n", 5); //TODO: PONER BIEN EL NUMERO

            i = j+1;
        }
        

    }



    write(STDOUT, "\n", 1);

    // cerramos el amigo y nos vamos
    close(fd);
    return 0;
    


    
    // Read the file content
/*
    while ((bytes_read = read(fd, buffer, BUFFER_SIZE - 1)) > 0) {
        buffer[bytes_read] = '\0'; // Null-terminate the buffer
        
        // Process the buffer line by line
        i = 0;
        while (i < bytes_read) {
            j = i;
            // Find the end of the current line
            while (j < bytes_read && buffer[j] != '\n') {
                j++;
            }
            
            // Create output with line number
            output_len = 0;
            
            // Convert line number to string and add it
            int temp_line = line_number;
            int digits = 0;
            do {
                digits++;
                temp_line /= 10;
            } while (temp_line > 0);
            
            // Copy line content first
            for (int k = i; k < j && k < bytes_read; k++) {
                output_buffer[output_len++] = buffer[k];
            }
            
            // Add separator and line number
            output_buffer[output_len++] = ' ';
            output_buffer[output_len++] = '[';
            
            // Insert the line number digits
            temp_line = line_number;
            for (int k = digits - 1; k >= 0; k--) {
                output_buffer[output_len + k] = '0' + (temp_line % 10);
                temp_line /= 10;
            }
            output_len += digits;
            
            output_buffer[output_len++] = ']';
            output_buffer[output_len++] = '\n';
            
            // Write the line with its number
            write(STDOUT, output_buffer, output_len);
            
            // Move to the next line
            if (j < bytes_read && buffer[j] == '\n') {
                j++;
            }
            i = j;
            line_number++;
        }
    }
*/
    
    
}