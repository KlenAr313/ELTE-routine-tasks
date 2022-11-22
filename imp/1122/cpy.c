void strcopy(char* txt1, char* txt2){
    int i = 0;
    while (txt1[i] != '\0' && txt1[i] != '\n' && txt1[i] != '\r'){
        txt2[i] = txt1[i];
        i++;
    }
    txt2[i] = '\0';
}