import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subs_name" field.
  String? _subsName;
  String get subsName => _subsName ?? '';
  bool hasSubsName() => _subsName != null;

  // "monthly_credits" field.
  int? _monthlyCredits;
  int get monthlyCredits => _monthlyCredits ?? 0;
  bool hasMonthlyCredits() => _monthlyCredits != null;

  // "subs_type" field.
  String? _subsType;
  String get subsType => _subsType ?? '';
  bool hasSubsType() => _subsType != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "max_credits" field.
  int? _maxCredits;
  int get maxCredits => _maxCredits ?? 0;
  bool hasMaxCredits() => _maxCredits != null;

  // "base_price" field.
  double? _basePrice;
  double get basePrice => _basePrice ?? 0.0;
  bool hasBasePrice() => _basePrice != null;

  // "free_limited" field.
  bool? _freeLimited;
  bool get freeLimited => _freeLimited ?? false;
  bool hasFreeLimited() => _freeLimited != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "inc_ChatBots" field.
  List<DocumentReference>? _incChatBots;
  List<DocumentReference> get incChatBots => _incChatBots ?? const [];
  bool hasIncChatBots() => _incChatBots != null;

  // "inc_SuperBots" field.
  List<DocumentReference>? _incSuperBots;
  List<DocumentReference> get incSuperBots => _incSuperBots ?? const [];
  bool hasIncSuperBots() => _incSuperBots != null;

  void _initializeFields() {
    _subsName = snapshotData['subs_name'] as String?;
    _monthlyCredits = castToType<int>(snapshotData['monthly_credits']);
    _subsType = snapshotData['subs_type'] as String?;
    _currency = snapshotData['currency'] as String?;
    _maxCredits = castToType<int>(snapshotData['max_credits']);
    _basePrice = castToType<double>(snapshotData['base_price']);
    _freeLimited = snapshotData['free_limited'] as bool?;
    _active = snapshotData['active'] as bool?;
    _incChatBots = getDataList(snapshotData['inc_ChatBots']);
    _incSuperBots = getDataList(snapshotData['inc_SuperBots']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  String? subsName,
  int? monthlyCredits,
  String? subsType,
  String? currency,
  int? maxCredits,
  double? basePrice,
  bool? freeLimited,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subs_name': subsName,
      'monthly_credits': monthlyCredits,
      'subs_type': subsType,
      'currency': currency,
      'max_credits': maxCredits,
      'base_price': basePrice,
      'free_limited': freeLimited,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.subsName == e2?.subsName &&
        e1?.monthlyCredits == e2?.monthlyCredits &&
        e1?.subsType == e2?.subsType &&
        e1?.currency == e2?.currency &&
        e1?.maxCredits == e2?.maxCredits &&
        e1?.basePrice == e2?.basePrice &&
        e1?.freeLimited == e2?.freeLimited &&
        e1?.active == e2?.active &&
        listEquality.equals(e1?.incChatBots, e2?.incChatBots) &&
        listEquality.equals(e1?.incSuperBots, e2?.incSuperBots);
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.subsName,
        e?.monthlyCredits,
        e?.subsType,
        e?.currency,
        e?.maxCredits,
        e?.basePrice,
        e?.freeLimited,
        e?.active,
        e?.incChatBots,
        e?.incSuperBots
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
