import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "credits" field.
  int? _credits;
  int get credits => _credits ?? 0;
  bool hasCredits() => _credits != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "subscription" field.
  DocumentReference? _subscription;
  DocumentReference? get subscription => _subscription;
  bool hasSubscription() => _subscription != null;

  // "subs_name" field.
  String? _subsName;
  String get subsName => _subsName ?? '';
  bool hasSubsName() => _subsName != null;

  // "myChatBots" field.
  List<DocumentReference>? _myChatBots;
  List<DocumentReference> get myChatBots => _myChatBots ?? const [];
  bool hasMyChatBots() => _myChatBots != null;

  // "mySuperBots" field.
  List<DocumentReference>? _mySuperBots;
  List<DocumentReference> get mySuperBots => _mySuperBots ?? const [];
  bool hasMySuperBots() => _mySuperBots != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "passedBeta" field.
  bool? _passedBeta;
  bool get passedBeta => _passedBeta ?? false;
  bool hasPassedBeta() => _passedBeta != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _credits = castToType<int>(snapshotData['credits']);
    _gender = snapshotData['gender'] as String?;
    _subscription = snapshotData['subscription'] as DocumentReference?;
    _subsName = snapshotData['subs_name'] as String?;
    _myChatBots = getDataList(snapshotData['myChatBots']);
    _mySuperBots = getDataList(snapshotData['mySuperBots']);
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _passedBeta = snapshotData['passedBeta'] as bool?;
    _age = castToType<int>(snapshotData['age']);
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userType,
  int? credits,
  String? gender,
  DocumentReference? subscription,
  String? subsName,
  bool? isAdmin,
  bool? passedBeta,
  int? age,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_type': userType,
      'credits': credits,
      'gender': gender,
      'subscription': subscription,
      'subs_name': subsName,
      'isAdmin': isAdmin,
      'passedBeta': passedBeta,
      'age': age,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userType == e2?.userType &&
        e1?.credits == e2?.credits &&
        e1?.gender == e2?.gender &&
        e1?.subscription == e2?.subscription &&
        e1?.subsName == e2?.subsName &&
        listEquality.equals(e1?.myChatBots, e2?.myChatBots) &&
        listEquality.equals(e1?.mySuperBots, e2?.mySuperBots) &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.passedBeta == e2?.passedBeta &&
        e1?.age == e2?.age &&
        e1?.country == e2?.country;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userType,
        e?.credits,
        e?.gender,
        e?.subscription,
        e?.subsName,
        e?.myChatBots,
        e?.mySuperBots,
        e?.isAdmin,
        e?.passedBeta,
        e?.age,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
