/* sampleCodeModule.c */



int main() {
	char * screen = (char*)0xB8000;
	const char * msg = "Arquitectura de computadoras";
	const char style = 0x30;
	//All the following code may be removed 
	for (int i = 0; msg[i] != 0; i++) {
		screen[2*i] = msg[i];
		screen[2*i + 1] = style;
	}

	return 0xDEADBEEF;
}

