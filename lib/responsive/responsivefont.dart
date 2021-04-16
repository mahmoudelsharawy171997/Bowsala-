import 'package:flutter/material.dart';



responsiveSignUpFont(MediaQueryData data){

  double _deviceWidth = data.size.width;

  if(_deviceWidth <= 350){
    return 15.0;
  }else{
    return 20.0;
  }
}


responsiveHomeDateFont(MediaQueryData data){

  double _deviceWidth = data.size.width;

  if(_deviceWidth <= 350){
    return 10.0;
  }else{
    return 15.0;
  }
}