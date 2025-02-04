import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'simulated_therapy_widget.dart' show SimulatedTherapyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SimulatedTherapyModel extends FlutterFlowModel<SimulatedTherapyWidget> {
  ///  Local state fields for this page.

  int? simStep = 1;

  bool simFinished = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Custom Action - convertInvertedListToJson] action in Button widget.
  List<dynamic>? jsonContextInverted;
  // Stores action output result for [Backend Call - API (PatientCompletion)] action in Button widget.
  ApiCallResponse? patientReply;
  // Stores action output result for [Custom Action - convertListToJson] action in Button widget.
  List<dynamic>? newContext;
  // Stores action output result for [Backend Call - API (ChatBotCompletion)] action in Button widget.
  ApiCallResponse? botReply;
  // State field(s) for DropDownNumMsgs widget.
  String? dropDownNumMsgsValue;
  FormFieldController<String>? dropDownNumMsgsValueController;
  // State field(s) for DropDownTemp widget.
  String? dropDownTempValue;
  FormFieldController<String>? dropDownTempValueController;
  // State field(s) for TextField_BotName widget.
  FocusNode? textFieldBotNameFocusNode;
  TextEditingController? textFieldBotNameController;
  String? Function(BuildContext, String?)? textFieldBotNameControllerValidator;
  // State field(s) for DropDown_Approach widget.
  String? dropDownApproachValue;
  FormFieldController<String>? dropDownApproachValueController;
  // State field(s) for TextField_BotPers widget.
  FocusNode? textFieldBotPersFocusNode;
  TextEditingController? textFieldBotPersController;
  String? Function(BuildContext, String?)? textFieldBotPersControllerValidator;
  // State field(s) for TextField_PatName widget.
  FocusNode? textFieldPatNameFocusNode;
  TextEditingController? textFieldPatNameController;
  String? Function(BuildContext, String?)? textFieldPatNameControllerValidator;
  // State field(s) for TextField_PatAge widget.
  FocusNode? textFieldPatAgeFocusNode;
  TextEditingController? textFieldPatAgeController;
  String? Function(BuildContext, String?)? textFieldPatAgeControllerValidator;
  // State field(s) for DropDownPatGender widget.
  String? dropDownPatGenderValue;
  FormFieldController<String>? dropDownPatGenderValueController;
  // State field(s) for TextField_PatDiag widget.
  FocusNode? textFieldPatDiagFocusNode;
  TextEditingController? textFieldPatDiagController;
  String? Function(BuildContext, String?)? textFieldPatDiagControllerValidator;
  // State field(s) for TextField_PatProblem widget.
  FocusNode? textFieldPatProblemFocusNode;
  TextEditingController? textFieldPatProblemController;
  String? Function(BuildContext, String?)?
      textFieldPatProblemControllerValidator;
  // State field(s) for TextField_PatPers widget.
  FocusNode? textFieldPatPersFocusNode;
  TextEditingController? textFieldPatPersController;
  String? Function(BuildContext, String?)? textFieldPatPersControllerValidator;
  // State field(s) for SimulMsgs widget.
  ScrollController? simulMsgs;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    simulMsgs = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    textFieldBotNameFocusNode?.dispose();
    textFieldBotNameController?.dispose();

    textFieldBotPersFocusNode?.dispose();
    textFieldBotPersController?.dispose();

    textFieldPatNameFocusNode?.dispose();
    textFieldPatNameController?.dispose();

    textFieldPatAgeFocusNode?.dispose();
    textFieldPatAgeController?.dispose();

    textFieldPatDiagFocusNode?.dispose();
    textFieldPatDiagController?.dispose();

    textFieldPatProblemFocusNode?.dispose();
    textFieldPatProblemController?.dispose();

    textFieldPatPersFocusNode?.dispose();
    textFieldPatPersController?.dispose();

    simulMsgs?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
