import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  BotsRecord? chatPagePreviousSnapshot;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListViewMsgs widget.
  ScrollController? listViewMsgs;
  // State field(s) for UserInputField widget.
  FocusNode? userInputFieldFocusNode;
  TextEditingController? userInputFieldController;
  String? Function(BuildContext, String?)? userInputFieldControllerValidator;
  // Stores action output result for [Custom Action - convertListToJson] action in IconButton widget.
  List<dynamic>? jsonContext;
  // Stores action output result for [Backend Call - API (ChatBotCompletion)] action in IconButton widget.
  ApiCallResponse? chatBotResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewMsgs = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewMsgs?.dispose();
    userInputFieldFocusNode?.dispose();
    userInputFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
