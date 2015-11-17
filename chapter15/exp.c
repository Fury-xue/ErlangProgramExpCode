#include <stdio.h>

typedef unsigned char byte;
int main()
{
  int i;
  FILE *file = fopen("log","w");
  byte arr[] = {100,2,98,99,100,67,101,102,103};
  if(file == NULL)
    return -1;
  for(i=0;i<10;i++)
    {
      printf("%d writeing...\n",arr[i]);
      fprintf(file,"%d",arr[i]);
    }
  fclose(file);
  return 0;
}
