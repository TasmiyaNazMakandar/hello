
import 'package:flutter/material.dart';
class CalculateBmi  extends ChangeNotifier  {
var  height;
var  weigth;
var res;



get getres {
   return res;
}




void cal(double height1,double weight1){
var hsq;
height=height1/100;
weigth=weight1;
hsq = height * height;
res = weigth/hsq ;
notifyListeners();
}


}