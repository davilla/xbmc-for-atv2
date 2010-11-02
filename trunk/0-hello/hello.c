#include <stdio.h>

extern const char* mysql_get_client_info(void);
int main()
{
  float a=5.0, b=5.0, c;
  c=a*b;
  printf ("Hello World!, the value is %f\n", c);

  mysql_get_client_info();

  return(0);
}

