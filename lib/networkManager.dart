
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkManager {
  final Uri url;
  NetworkManager({@required this.url});

  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200 ){
      String data = response.body;
      var decodedData = jsonDecode(data);
      var rate = decodedData['rate'];
      
        double lastPrice = decodedData['last'];
      return rate.toStringAsFixed(0);
      
  
    }
    else{
      print(response.statusCode);
    }
  }
}