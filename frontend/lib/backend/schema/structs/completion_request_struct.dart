// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompletionRequestStruct extends FFFirebaseStruct {
  CompletionRequestStruct({
    String? systemRole,
    String? prompt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _systemRole = systemRole,
        _prompt = prompt,
        super(firestoreUtilData);

  // "system_role" field.
  String? _systemRole;
  String get systemRole => _systemRole ?? '';
  set systemRole(String? val) => _systemRole = val;
  bool hasSystemRole() => _systemRole != null;

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  set prompt(String? val) => _prompt = val;
  bool hasPrompt() => _prompt != null;

  static CompletionRequestStruct fromMap(Map<String, dynamic> data) =>
      CompletionRequestStruct(
        systemRole: data['system_role'] as String?,
        prompt: data['prompt'] as String?,
      );

  static CompletionRequestStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CompletionRequestStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'system_role': _systemRole,
        'prompt': _prompt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'system_role': serializeParam(
          _systemRole,
          ParamType.String,
        ),
        'prompt': serializeParam(
          _prompt,
          ParamType.String,
        ),
      }.withoutNulls;

  static CompletionRequestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CompletionRequestStruct(
        systemRole: deserializeParam(
          data['system_role'],
          ParamType.String,
          false,
        ),
        prompt: deserializeParam(
          data['prompt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CompletionRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompletionRequestStruct &&
        systemRole == other.systemRole &&
        prompt == other.prompt;
  }

  @override
  int get hashCode => const ListEquality().hash([systemRole, prompt]);
}

CompletionRequestStruct createCompletionRequestStruct({
  String? systemRole,
  String? prompt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompletionRequestStruct(
      systemRole: systemRole,
      prompt: prompt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompletionRequestStruct? updateCompletionRequestStruct(
  CompletionRequestStruct? completionRequest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    completionRequest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompletionRequestStructData(
  Map<String, dynamic> firestoreData,
  CompletionRequestStruct? completionRequest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (completionRequest == null) {
    return;
  }
  if (completionRequest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && completionRequest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final completionRequestData =
      getCompletionRequestFirestoreData(completionRequest, forFieldValue);
  final nestedData =
      completionRequestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = completionRequest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompletionRequestFirestoreData(
  CompletionRequestStruct? completionRequest, [
  bool forFieldValue = false,
]) {
  if (completionRequest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(completionRequest.toMap());

  // Add any Firestore field values
  completionRequest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompletionRequestListFirestoreData(
  List<CompletionRequestStruct>? completionRequests,
) =>
    completionRequests
        ?.map((e) => getCompletionRequestFirestoreData(e, true))
        .toList() ??
    [];
