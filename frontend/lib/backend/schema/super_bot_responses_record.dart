import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuperBotResponsesRecord extends FirestoreRecord {
  SuperBotResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "superBotName" field.
  String? _superBotName;
  String get superBotName => _superBotName ?? '';
  bool hasSuperBotName() => _superBotName != null;

  // "creationDateTime" field.
  DateTime? _creationDateTime;
  DateTime? get creationDateTime => _creationDateTime;
  bool hasCreationDateTime() => _creationDateTime != null;

  // "botResponse" field.
  String? _botResponse;
  String get botResponse => _botResponse ?? '';
  bool hasBotResponse() => _botResponse != null;

  // "userQuestion" field.
  String? _userQuestion;
  String get userQuestion => _userQuestion ?? '';
  bool hasUserQuestion() => _userQuestion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _superBotName = snapshotData['superBotName'] as String?;
    _creationDateTime = snapshotData['creationDateTime'] as DateTime?;
    _botResponse = snapshotData['botResponse'] as String?;
    _userQuestion = snapshotData['userQuestion'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('superBotResponses')
          : FirebaseFirestore.instance.collectionGroup('superBotResponses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('superBotResponses').doc();

  static Stream<SuperBotResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuperBotResponsesRecord.fromSnapshot(s));

  static Future<SuperBotResponsesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SuperBotResponsesRecord.fromSnapshot(s));

  static SuperBotResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuperBotResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuperBotResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuperBotResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuperBotResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuperBotResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuperBotResponsesRecordData({
  String? superBotName,
  DateTime? creationDateTime,
  String? botResponse,
  String? userQuestion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'superBotName': superBotName,
      'creationDateTime': creationDateTime,
      'botResponse': botResponse,
      'userQuestion': userQuestion,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuperBotResponsesRecordDocumentEquality
    implements Equality<SuperBotResponsesRecord> {
  const SuperBotResponsesRecordDocumentEquality();

  @override
  bool equals(SuperBotResponsesRecord? e1, SuperBotResponsesRecord? e2) {
    return e1?.superBotName == e2?.superBotName &&
        e1?.creationDateTime == e2?.creationDateTime &&
        e1?.botResponse == e2?.botResponse &&
        e1?.userQuestion == e2?.userQuestion;
  }

  @override
  int hash(SuperBotResponsesRecord? e) => const ListEquality().hash(
      [e?.superBotName, e?.creationDateTime, e?.botResponse, e?.userQuestion]);

  @override
  bool isValidKey(Object? o) => o is SuperBotResponsesRecord;
}
