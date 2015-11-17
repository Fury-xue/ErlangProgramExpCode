#include <stdio.h>
#include <stdlib.h>
typedef unsigned char byte;

int read_cmd(byte *buff);
int write_cmd(byte *buff,int len);
int sum(int x,int y);
int twice(int x);

int main()
{
  int fn,arg1,arg2,result;
  byte buff[100];
  while(read_cmd(buff) > 0)
    {
      write_log(buff);
      fn = buff[0];
      if(fn == 1)
        {
          arg1 = buff[1];
          arg2 = buff[2];
          /*调试，可以大引导stderr来调试
            fprint(stderr,"calling sum %i %i\n",arg1,arg2);*/
          result = sum(arg1,arg2);
        }else if (fn ==2) {
        arg1 = buff[1];
        result = twice(arg1);
      }else {
        exit(EXIT_FAILURE);
      }
      buff[0] = result;
      write_cmd(buff,1);
    }
  return 0;
}

int write_log(byte *buf)
{
  int i;
  FILE *file = fopen("log","a");
  if(file == NULL)
    return -1;
  for(i=0;i<(sizeof(buf)/sizeof(buf[0]));i++)
    fprintf(file,"%d\n",buf[i]);
  fclose(file);
  return 0;
}

