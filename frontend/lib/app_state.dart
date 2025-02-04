import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<ChatResponseStruct> _chatHistory = [];
  List<ChatResponseStruct> get chatHistory => _chatHistory;
  set chatHistory(List<ChatResponseStruct> _value) {
    _chatHistory = _value;
  }

  void addToChatHistory(ChatResponseStruct _value) {
    _chatHistory.add(_value);
  }

  void removeFromChatHistory(ChatResponseStruct _value) {
    _chatHistory.remove(_value);
  }

  void removeAtIndexFromChatHistory(int _index) {
    _chatHistory.removeAt(_index);
  }

  void updateChatHistoryAtIndex(
    int _index,
    ChatResponseStruct Function(ChatResponseStruct) updateFn,
  ) {
    _chatHistory[_index] = updateFn(_chatHistory[_index]);
  }

  void insertAtIndexInChatHistory(int _index, ChatResponseStruct _value) {
    _chatHistory.insert(_index, _value);
  }

  String _currentChatResponse = '';
  String get currentChatResponse => _currentChatResponse;
  set currentChatResponse(String _value) {
    _currentChatResponse = _value;
  }

  bool _SuperbotReplied = false;
  bool get SuperbotReplied => _SuperbotReplied;
  set SuperbotReplied(bool _value) {
    _SuperbotReplied = _value;
  }

  List<HintPromptStruct> _hintPromptList = [
    HintPromptStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Quiero contarte\",\"desc\":\"una cosa que me ha afectado\"}')),
    HintPromptStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"No sé cómo manejar\",\"desc\":\"la situación actual con mi pareja\"}'))
  ];
  List<HintPromptStruct> get hintPromptList => _hintPromptList;
  set hintPromptList(List<HintPromptStruct> _value) {
    _hintPromptList = _value;
  }

  void addToHintPromptList(HintPromptStruct _value) {
    _hintPromptList.add(_value);
  }

  void removeFromHintPromptList(HintPromptStruct _value) {
    _hintPromptList.remove(_value);
  }

  void removeAtIndexFromHintPromptList(int _index) {
    _hintPromptList.removeAt(_index);
  }

  void updateHintPromptListAtIndex(
    int _index,
    HintPromptStruct Function(HintPromptStruct) updateFn,
  ) {
    _hintPromptList[_index] = updateFn(_hintPromptList[_index]);
  }

  void insertAtIndexInHintPromptList(int _index, HintPromptStruct _value) {
    _hintPromptList.insert(_index, _value);
  }

  List<String> _BotsForThisUser = [];
  List<String> get BotsForThisUser => _BotsForThisUser;
  set BotsForThisUser(List<String> _value) {
    _BotsForThisUser = _value;
  }

  void addToBotsForThisUser(String _value) {
    _BotsForThisUser.add(_value);
  }

  void removeFromBotsForThisUser(String _value) {
    _BotsForThisUser.remove(_value);
  }

  void removeAtIndexFromBotsForThisUser(int _index) {
    _BotsForThisUser.removeAt(_index);
  }

  void updateBotsForThisUserAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _BotsForThisUser[_index] = updateFn(_BotsForThisUser[_index]);
  }

  void insertAtIndexInBotsForThisUser(int _index, String _value) {
    _BotsForThisUser.insert(_index, _value);
  }

  String _botNameFilter = '';
  String get botNameFilter => _botNameFilter;
  set botNameFilter(String _value) {
    _botNameFilter = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
