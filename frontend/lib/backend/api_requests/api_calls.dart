import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SupervisionBotCompletionCall {
  static Future<ApiCallResponse> call({
    String? ffApproach = 'Cognitivo Conductual',
    String? ffBotName = 'Carl',
    String? ffPatientAge = '18',
    String? ffPatientSex = 'mujer',
    String? ffPatientGender = 'mujer',
    String? ffPatientDiagnosis = 'ansiedad',
    String? ffPatientProblem = 'ideación suicida',
    String? ffUserid = '1234',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SupervisionBotCompletionCall',
        'variables': {
          'ffApproach': ffApproach,
          'ffBotName': ffBotName,
          'ffPatientAge': ffPatientAge,
          'ffPatientSex': ffPatientSex,
          'ffPatientGender': ffPatientGender,
          'ffPatientDiagnosis': ffPatientDiagnosis,
          'ffPatientProblem': ffPatientProblem,
          'ffUserid': ffUserid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic superBotResponse(dynamic response) => getJsonField(
        response,
        r'''$.bot_response''',
      );
}

class ChatBotCompletionCall {
  static Future<ApiCallResponse> call({
    String? ffBotApproach = 'cognitivo conductual',
    String? ffBotName = 'Carl',
    String? ffPatientAge = '',
    String? ffPatientGender = '',
    String? ffUserid = '1111',
    String? ffBotPersonality = '',
    String? ffPatientName = '',
    String? ffPatientProblem = '',
    dynamic? ffContextJson,
    String? botMode = '',
    double? botTemp = 0,
  }) async {
    final ffContext = _serializeJson(ffContextJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ChatBotCompletionCall',
        'variables': {
          'ffBotApproach': ffBotApproach,
          'ffBotName': ffBotName,
          'ffPatientAge': ffPatientAge,
          'ffPatientGender': ffPatientGender,
          'ffUserid': ffUserid,
          'ffBotPersonality': ffBotPersonality,
          'ffPatientName': ffPatientName,
          'ffPatientProblem': ffPatientProblem,
          'ffContext': ffContext,
          'botMode': botMode,
          'botTemp': botTemp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic apiChatBotResponse(dynamic response) => getJsonField(
        response,
        r'''$.bot_response''',
      );
}

class PatientCompletionCall {
  static Future<ApiCallResponse> call({
    dynamic? contextJson,
    String? patAge = '22',
    String? patName = 'Teo',
    String? patCountry = 'España',
    String? patDiag = 'ansiedad',
    String? patGender = 'hombre',
    String? patPers = 'introvertido',
    String? patProblem = 'queja constante',
    String? userid = 'aaa222',
    String? botMode = '',
    double? botTemp = 0,
  }) async {
    final context = _serializeJson(contextJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PatientCompletionCall',
        'variables': {
          'context': context,
          'patAge': patAge,
          'patName': patName,
          'patCountry': patCountry,
          'patDiag': patDiag,
          'patGender': patGender,
          'patPers': patPers,
          'patProblem': patProblem,
          'userid': userid,
          'botMode': botMode,
          'botTemp': botTemp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic patientResponse(dynamic response) => getJsonField(
        response,
        r'''$.patient_response''',
      );
}

class RecruitCompletionCall {
  static Future<ApiCallResponse> call({
    String? botApproach = 'entrevista de selección',
    String? botMode = 'succint',
    String? botName = 'María',
    String? botPersonality = 'seria y formal',
    String? botRole = 'recruiter',
    double? botTemp = 0.0,
    String? candAge = '29',
    String? candCountry = 'España',
    String? candGender = 'mujer',
    String? candName = 'Ana',
    String? candPersonality = 'introvertida',
    String? candResume = '10 años de experiencia como programadora',
    String? jobCompany = 'Super Software',
    String? jobTitle = 'data scientist',
    String? jobDesc = 'científico de datos con python',
    String? jobSkills = 'python y java',
    String? jobNumQuestions = '3',
    dynamic? contextJson,
    String? userid = '44444',
  }) async {
    final context = _serializeJson(contextJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RecruitCompletionCall',
        'variables': {
          'botApproach': botApproach,
          'botMode': botMode,
          'botName': botName,
          'botPersonality': botPersonality,
          'botRole': botRole,
          'botTemp': botTemp,
          'candAge': candAge,
          'candCountry': candCountry,
          'candGender': candGender,
          'candName': candName,
          'candPersonality': candPersonality,
          'candResume': candResume,
          'jobCompany': jobCompany,
          'jobTitle': jobTitle,
          'jobDesc': jobDesc,
          'jobSkills': jobSkills,
          'jobNumQuestions': jobNumQuestions,
          'context': context,
          'userid': userid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic botResponse(dynamic response) => getJsonField(
        response,
        r'''$.bot_response''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
