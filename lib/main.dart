

import 'dart:io';

void main(){

  double? base=double.tryParse(stdin.readLineSync()!);
  double? height=double.tryParse(stdin.readLineSync()!);
  if(base==null || height==null)
    {
      print("invalid input");
    }
  else
    {
      double ans=triangle(base,height);
      print("Area of triangel :$ans");
    }
}
double triangle(double base,double height)
{
    return (0.5*base*height);
}