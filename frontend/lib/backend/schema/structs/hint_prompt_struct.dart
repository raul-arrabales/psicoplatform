// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HintPromptStruct extends FFFirebaseStruct {
  HintPromptStruct({
    String? title,
    String? desc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _desc = desc,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;
  bool hasDesc() => _desc != null;

  static HintPromptStruct fromMap(Map<String, dynamic> data) =>
      HintPromptStruct(
        title: data['title'] as String?,
        desc: data['desc'] as String?,
      );

  static HintPromptStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? HintPromptStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'desc': _desc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
      }.withoutNulls;

  static HintPromptStruct fromSerializableMap(Map<String, dynamic> data) =>
      HintPromptStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HintPromptStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HintPromptStruct &&
        title == other.title &&
        desc == other.desc;
  }

  @override
  int get hashCode => const ListEquality().hash([title, desc]);
}

HintPromptStruct createHintPromptStruct({
  String? title,
  String? desc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HintPromptStruct(
      title: title,
      desc: desc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HintPromptStruct? updateHintPromptStruct(
  HintPromptStruct? hintPrompt, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    hintPrompt
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHintPromptStructData(
  Map<String, dynamic> firestoreData,
  HintPromptStruct? hintPrompt,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (hintPrompt == null) {
    return;
  }
  if (hintPrompt.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && hintPrompt.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final hintPromptData = getHintPromptFirestoreData(hintPrompt, forFieldValue);
  final nestedData = hintPromptData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = hintPrompt.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHintPromptFirestoreData(
  HintPromptStruct? hintPrompt, [
  bool forFieldValue = false,
]) {
  if (hintPrompt == null) {
    return {};
  }
  final firestoreData = mapToFirestore(hintPrompt.toMap());

  // Add any Firestore field values
  hintPrompt.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHintPromptListFirestoreData(
  List<HintPromptStruct>? hintPrompts,
) =>
    hintPrompts?.map((e) => getHintPromptFirestoreData(e, true)).toList() ?? [];
