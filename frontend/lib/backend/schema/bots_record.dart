import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotsRecord extends FirestoreRecord {
  BotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bot_name" field.
  String? _botName;
  String get botName => _botName ?? '';
  bool hasBotName() => _botName != null;

  // "bot_desc" field.
  String? _botDesc;
  String get botDesc => _botDesc ?? '';
  bool hasBotDesc() => _botDesc != null;

  // "bot_image_path" field.
  String? _botImagePath;
  String get botImagePath => _botImagePath ?? '';
  bool hasBotImagePath() => _botImagePath != null;

  // "bot_type" field.
  String? _botType;
  String get botType => _botType ?? '';
  bool hasBotType() => _botType != null;

  // "bot_approach" field.
  String? _botApproach;
  String get botApproach => _botApproach ?? '';
  bool hasBotApproach() => _botApproach != null;

  // "bot_personality" field.
  String? _botPersonality;
  String get botPersonality => _botPersonality ?? '';
  bool hasBotPersonality() => _botPersonality != null;

  // "bot_genre" field.
  String? _botGenre;
  String get botGenre => _botGenre ?? '';
  bool hasBotGenre() => _botGenre != null;

  // "inBasicPlan" field.
  bool? _inBasicPlan;
  bool get inBasicPlan => _inBasicPlan ?? false;
  bool hasInBasicPlan() => _inBasicPlan != null;

  // "inTherapistPlan" field.
  bool? _inTherapistPlan;
  bool get inTherapistPlan => _inTherapistPlan ?? false;
  bool hasInTherapistPlan() => _inTherapistPlan != null;

  void _initializeFields() {
    _botName = snapshotData['bot_name'] as String?;
    _botDesc = snapshotData['bot_desc'] as String?;
    _botImagePath = snapshotData['bot_image_path'] as String?;
    _botType = snapshotData['bot_type'] as String?;
    _botApproach = snapshotData['bot_approach'] as String?;
    _botPersonality = snapshotData['bot_personality'] as String?;
    _botGenre = snapshotData['bot_genre'] as String?;
    _inBasicPlan = snapshotData['inBasicPlan'] as bool?;
    _inTherapistPlan = snapshotData['inTherapistPlan'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bots');

  static Stream<BotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BotsRecord.fromSnapshot(s));

  static Future<BotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BotsRecord.fromSnapshot(s));

  static BotsRecord fromSnapshot(DocumentSnapshot snapshot) => BotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBotsRecordData({
  String? botName,
  String? botDesc,
  String? botImagePath,
  String? botType,
  String? botApproach,
  String? botPersonality,
  String? botGenre,
  bool? inBasicPlan,
  bool? inTherapistPlan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bot_name': botName,
      'bot_desc': botDesc,
      'bot_image_path': botImagePath,
      'bot_type': botType,
      'bot_approach': botApproach,
      'bot_personality': botPersonality,
      'bot_genre': botGenre,
      'inBasicPlan': inBasicPlan,
      'inTherapistPlan': inTherapistPlan,
    }.withoutNulls,
  );

  return firestoreData;
}

class BotsRecordDocumentEquality implements Equality<BotsRecord> {
  const BotsRecordDocumentEquality();

  @override
  bool equals(BotsRecord? e1, BotsRecord? e2) {
    return e1?.botName == e2?.botName &&
        e1?.botDesc == e2?.botDesc &&
        e1?.botImagePath == e2?.botImagePath &&
        e1?.botType == e2?.botType &&
        e1?.botApproach == e2?.botApproach &&
        e1?.botPersonality == e2?.botPersonality &&
        e1?.botGenre == e2?.botGenre &&
        e1?.inBasicPlan == e2?.inBasicPlan &&
        e1?.inTherapistPlan == e2?.inTherapistPlan;
  }

  @override
  int hash(BotsRecord? e) => const ListEquality().hash([
        e?.botName,
        e?.botDesc,
        e?.botImagePath,
        e?.botType,
        e?.botApproach,
        e?.botPersonality,
        e?.botGenre,
        e?.inBasicPlan,
        e?.inTherapistPlan
      ]);

  @override
  bool isValidKey(Object? o) => o is BotsRecord;
}
