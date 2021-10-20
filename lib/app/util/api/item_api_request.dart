import 'dart:convert';
import 'dart:io';
import 'package:bliss/app/global/colors.dart';
import 'package:bliss/app/model/item.dart';
import 'package:bliss/app/util/api/util_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

Future<Data> getAllItemDataList(context) async {
  Data data;
  try {
    print("body:---> OK");
    final response = await http.get(
      API_ITEM_LIST,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print("body:---> ERRIR");
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      print("body:---> ${response.body}");
      data = Data.fromJson(items);
    }else if(response.statusCode == 400){
      Toast.show("bad request", context,
          backgroundColor: Colors.red, textColor: red);
    }else if(response.statusCode == 401 ){
      Toast.show("unauthorized", context,
          backgroundColor: Colors.red, textColor: red);
    }
    else if(response.statusCode == 500){
      Toast.show("DB error", context,
          backgroundColor: Colors.red, textColor: red);
    }else if(response.statusCode == 404){
      Toast.show("couldn't be found", context,
          backgroundColor: Colors.red, textColor: red);
    }
    else {
      Toast.show("Failed Loading API", context,
          backgroundColor: Colors.red, textColor: red);
    }
  } catch (e) {
    Toast.show("Server error", context,
        backgroundColor: Colors.red, textColor: red);
  }
  return data;
}


