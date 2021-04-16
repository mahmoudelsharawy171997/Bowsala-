import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


Future<String> getJson() {
  return rootBundle.loadString('assets/data.json');
  }


  data() async {
    List k = [];
    Map<String, dynamic> data = json.decode(await getJson());
    for( var i in data['Shipsy Destination']){
      print(i);
    }
  }