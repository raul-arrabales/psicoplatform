// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatResponseStruct extends FFFirebaseStruct {
  ChatResponseStruct({
    String? author,
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _author = author,
        _content = content,
        super(firestoreUtilData);

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  static ChatResponseStruct fromMap(Map<String, dynamic> data) =>
      ChatResponseStruct(
        author: data['author'] as String?,
        content: data['content'] as String?,
      );

  static ChatResponseStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatResponseStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'author': _author,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatResponseStruct(
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatResponseStruct &&
        author == other.author &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([author, content]);
}

ChatResponseStruct createChatResponseStruct({
  String? author,
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatResponseStruct(
      author: author,
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatResponseStruct? updateChatResponseStruct(
  ChatResponseStruct? chatResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatResponseStructData(
  Map<String, dynamic> firestoreData,
  ChatResponseStruct? chatResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatResponse == null) {
    return;
  }
  if (chatResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatResponseData =
      getChatResponseFirestoreData(chatResponse, forFieldValue);
  final nestedData =
      chatResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatResponseFirestoreData(
  ChatResponseStruct? chatResponse, [
  bool forFieldValue = false,
]) {
  if (chatResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatResponse.toMap());

  // Add any Firestore field values
  chatResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatResponseListFirestoreData(
  List<ChatResponseStruct>? chatResponses,
) =>
    chatResponses?.map((e) => getChatResponseFirestoreData(e, true)).toList() ??
    [];
