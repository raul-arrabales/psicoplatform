import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatBotChatsRecord extends FirestoreRecord {
  ChatBotChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "messages" field.
  List<ChatResponseStruct>? _messages;
  List<ChatResponseStruct> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "bot_name" field.
  String? _botName;
  String get botName => _botName ?? '';
  bool hasBotName() => _botName != null;

  // "creationDateTime" field.
  DateTime? _creationDateTime;
  DateTime? get creationDateTime => _creationDateTime;
  bool hasCreationDateTime() => _creationDateTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messages = getStructList(
      snapshotData['messages'],
      ChatResponseStruct.fromMap,
    );
    _botName = snapshotData['bot_name'] as String?;
    _creationDateTime = snapshotData['creationDateTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatBotChats')
          : FirebaseFirestore.instance.collectionGroup('chatBotChats');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chatBotChats').doc();

  static Stream<ChatBotChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatBotChatsRecord.fromSnapshot(s));

  static Future<ChatBotChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatBotChatsRecord.fromSnapshot(s));

  static ChatBotChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatBotChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatBotChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatBotChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatBotChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatBotChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatBotChatsRecordData({
  String? botName,
  DateTime? creationDateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bot_name': botName,
      'creationDateTime': creationDateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatBotChatsRecordDocumentEquality
    implements Equality<ChatBotChatsRecord> {
  const ChatBotChatsRecordDocumentEquality();

  @override
  bool equals(ChatBotChatsRecord? e1, ChatBotChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.botName == e2?.botName &&
        e1?.creationDateTime == e2?.creationDateTime;
  }

  @override
  int hash(ChatBotChatsRecord? e) =>
      const ListEquality().hash([e?.messages, e?.botName, e?.creationDateTime]);

  @override
  bool isValidKey(Object? o) => o is ChatBotChatsRecord;
}
