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

Future<List<DocumentReference>> getBotRefsFromNames(
    List<String> botNameList) async {
  // return a list of document references whose field bot_name is in input list
// Get a reference to the Firestore collection containing the bots
  CollectionReference botCollection =
      FirebaseFirestore.instance.collection('bots');

  // Query the collection for bots with names in the input list
  QuerySnapshot querySnapshot =
      await botCollection.where('bot_name', whereIn: botNameList).get();

  // Extract the document references from the query snapshot
  List<DocumentReference> botRefs =
      querySnapshot.docs.map((doc) => botCollection.doc(doc.id)).toList();

  return botRefs;
}
