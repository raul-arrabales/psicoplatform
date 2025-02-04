import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_bot_widget.dart' show FormBotWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormBotModel extends FlutterFlowModel<FormBotWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown_age widget.
  String? dropDownAgeValue;
  FormFieldController<String>? dropDownAgeValueController;
  // State field(s) for DropDown_sex widget.
  String? dropDownSexValue;
  FormFieldController<String>? dropDownSexValueController;
  // State field(s) for DropDown_gender widget.
  String? dropDownGenderValue;
  FormFieldController<String>? dropDownGenderValueController;
  // State field(s) for TextField_diag widget.
  FocusNode? textFieldDiagFocusNode;
  TextEditingController? textFieldDiagController;
  String? Function(BuildContext, String?)? textFieldDiagControllerValidator;
  // State field(s) for TextField_problem widget.
  FocusNode? textFieldProblemFocusNode;
  TextEditingController? textFieldProblemController;
  String? Function(BuildContext, String?)? textFieldProblemControllerValidator;
  // Stores action output result for [Backend Call - API (SupervisionBotCompletion)] action in Button_GetBotResponse widget.
  ApiCallResponse? superbotAPIresponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldDiagFocusNode?.dispose();
    textFieldDiagController?.dispose();

    textFieldProblemFocusNode?.dispose();
    textFieldProblemController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
