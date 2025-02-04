// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClinicalCaseStruct extends FFFirebaseStruct {
  ClinicalCaseStruct({
    String? gender,
    String? sex,
    String? approach,
    String? age,
    String? diagnosis,
    String? problem,
    String? botName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gender = gender,
        _sex = sex,
        _approach = approach,
        _age = age,
        _diagnosis = diagnosis,
        _problem = problem,
        _botName = botName,
        super(firestoreUtilData);

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  set sex(String? val) => _sex = val;
  bool hasSex() => _sex != null;

  // "approach" field.
  String? _approach;
  String get approach => _approach ?? '';
  set approach(String? val) => _approach = val;
  bool hasApproach() => _approach != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;
  bool hasAge() => _age != null;

  // "diagnosis" field.
  String? _diagnosis;
  String get diagnosis => _diagnosis ?? '';
  set diagnosis(String? val) => _diagnosis = val;
  bool hasDiagnosis() => _diagnosis != null;

  // "problem" field.
  String? _problem;
  String get problem => _problem ?? '';
  set problem(String? val) => _problem = val;
  bool hasProblem() => _problem != null;

  // "bot_name" field.
  String? _botName;
  String get botName => _botName ?? '';
  set botName(String? val) => _botName = val;
  bool hasBotName() => _botName != null;

  static ClinicalCaseStruct fromMap(Map<String, dynamic> data) =>
      ClinicalCaseStruct(
        gender: data['gender'] as String?,
        sex: data['sex'] as String?,
        approach: data['approach'] as String?,
        age: data['age'] as String?,
        diagnosis: data['diagnosis'] as String?,
        problem: data['problem'] as String?,
        botName: data['bot_name'] as String?,
      );

  static ClinicalCaseStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ClinicalCaseStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'gender': _gender,
        'sex': _sex,
        'approach': _approach,
        'age': _age,
        'diagnosis': _diagnosis,
        'problem': _problem,
        'bot_name': _botName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'sex': serializeParam(
          _sex,
          ParamType.String,
        ),
        'approach': serializeParam(
          _approach,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.String,
        ),
        'diagnosis': serializeParam(
          _diagnosis,
          ParamType.String,
        ),
        'problem': serializeParam(
          _problem,
          ParamType.String,
        ),
        'bot_name': serializeParam(
          _botName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClinicalCaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClinicalCaseStruct(
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        sex: deserializeParam(
          data['sex'],
          ParamType.String,
          false,
        ),
        approach: deserializeParam(
          data['approach'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.String,
          false,
        ),
        diagnosis: deserializeParam(
          data['diagnosis'],
          ParamType.String,
          false,
        ),
        problem: deserializeParam(
          data['problem'],
          ParamType.String,
          false,
        ),
        botName: deserializeParam(
          data['bot_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClinicalCaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClinicalCaseStruct &&
        gender == other.gender &&
        sex == other.sex &&
        approach == other.approach &&
        age == other.age &&
        diagnosis == other.diagnosis &&
        problem == other.problem &&
        botName == other.botName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([gender, sex, approach, age, diagnosis, problem, botName]);
}

ClinicalCaseStruct createClinicalCaseStruct({
  String? gender,
  String? sex,
  String? approach,
  String? age,
  String? diagnosis,
  String? problem,
  String? botName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClinicalCaseStruct(
      gender: gender,
      sex: sex,
      approach: approach,
      age: age,
      diagnosis: diagnosis,
      problem: problem,
      botName: botName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClinicalCaseStruct? updateClinicalCaseStruct(
  ClinicalCaseStruct? clinicalCase, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clinicalCase
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClinicalCaseStructData(
  Map<String, dynamic> firestoreData,
  ClinicalCaseStruct? clinicalCase,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clinicalCase == null) {
    return;
  }
  if (clinicalCase.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clinicalCase.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clinicalCaseData =
      getClinicalCaseFirestoreData(clinicalCase, forFieldValue);
  final nestedData =
      clinicalCaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clinicalCase.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClinicalCaseFirestoreData(
  ClinicalCaseStruct? clinicalCase, [
  bool forFieldValue = false,
]) {
  if (clinicalCase == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clinicalCase.toMap());

  // Add any Firestore field values
  clinicalCase.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClinicalCaseListFirestoreData(
  List<ClinicalCaseStruct>? clinicalCases,
) =>
    clinicalCases?.map((e) => getClinicalCaseFirestoreData(e, true)).toList() ??
    [];
