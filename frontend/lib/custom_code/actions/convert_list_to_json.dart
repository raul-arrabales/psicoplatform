// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> convertListToJson(
    List<ChatResponseStruct> responseList) async {
  // convert responseList to list of json body
  List<dynamic> jsonList = [];

  for (int i = 0; i < responseList.length; i++) {
    ChatResponseStruct response = responseList[i];
    Map<String, dynamic> jsonBody = {
      "role": response.author,
      "content": response.content,
    };
    jsonList.add(jsonBody);
  }
  return jsonList;
}
