import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserTypesRecord extends FirestoreRecord {
  UserTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_type_name" field.
  String? _userTypeName;
  String get userTypeName => _userTypeName ?? '';
  bool hasUserTypeName() => _userTypeName != null;

  // "user_type_desc" field.
  String? _userTypeDesc;
  String get userTypeDesc => _userTypeDesc ?? '';
  bool hasUserTypeDesc() => _userTypeDesc != null;

  void _initializeFields() {
    _userTypeName = snapshotData['user_type_name'] as String?;
    _userTypeDesc = snapshotData['user_type_desc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_types');

  static Stream<UserTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTypesRecord.fromSnapshot(s));

  static Future<UserTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTypesRecord.fromSnapshot(s));

  static UserTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTypesRecordData({
  String? userTypeName,
  String? userTypeDesc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_type_name': userTypeName,
      'user_type_desc': userTypeDesc,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserTypesRecordDocumentEquality implements Equality<UserTypesRecord> {
  const UserTypesRecordDocumentEquality();

  @override
  bool equals(UserTypesRecord? e1, UserTypesRecord? e2) {
    return e1?.userTypeName == e2?.userTypeName &&
        e1?.userTypeDesc == e2?.userTypeDesc;
  }

  @override
  int hash(UserTypesRecord? e) =>
      const ListEquality().hash([e?.userTypeName, e?.userTypeDesc]);

  @override
  bool isValidKey(Object? o) => o is UserTypesRecord;
}
