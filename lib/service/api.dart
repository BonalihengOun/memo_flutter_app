import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/noted_model.dart';

class Api {
  static const baseUrl = "http://192.168.117.143:3000/api/";

  //Post api
  static addnote(Map ndata) async {
    print(ndata);
    var url = Uri.parse(baseUrl + "addnote");
    try {
      final res = await http.post(url, body: ndata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to Upload Data");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Get api
  static Future<List<Noted>> getNote() async {
    List<Noted> noted = [];
    try {
      final res = await http.get(Uri.parse("$baseUrl/get_noted"));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);
        data['Note']?.forEach((value) => {
              noted.add(Noted(
                title: value['Ntitle'],
                note: value['Nnote'],
                description: value['Ndescription'],
              ))
            });
        return noted;
      } else {
        return []; // or handle error case accordingly
      }
    } catch (e) {
      debugPrint(e.toString());
      throw e; // rethrow the exception to propagate the error
    }
  }
}
