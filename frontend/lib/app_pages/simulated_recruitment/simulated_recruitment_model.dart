import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'simulated_recruitment_widget.dart' show SimulatedRecruitmentWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SimulatedRecruitmentModel
    extends FlutterFlowModel<SimulatedRecruitmentWidget> {
  ///  Local state fields for this page.

  int? simStep = 1;

  bool simFinished = false;

  bool simRunning = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Custom Action - convertInvertedListToJson] action in Button widget.
  List<dynamic>? contextForCandidate;
  // Stores action output result for [Backend Call - API (RecruitCompletion)] action in Button widget.
  ApiCallResponse? candResponse;
  // Stores action output result for [Custom Action - convertListToJson] action in Button widget.
  List<dynamic>? contextForRecruiter;
  // Stores action output result for [Backend Call - API (RecruitCompletion)] action in Button widget.
  ApiCallResponse? recruiterReply;
  // State field(s) for DropDownNumMsgs widget.
  String? dropDownNumMsgsValue;
  FormFieldController<String>? dropDownNumMsgsValueController;
  // State field(s) for DropDownNumQuestions widget.
  String? dropDownNumQuestionsValue;
  FormFieldController<String>? dropDownNumQuestionsValueController;
  // State field(s) for DropDownTemp widget.
  String? dropDownTempValue;
  FormFieldController<String>? dropDownTempValueController;
  // State field(s) for TextField_Company widget.
  FocusNode? textFieldCompanyFocusNode;
  TextEditingController? textFieldCompanyController;
  String? Function(BuildContext, String?)? textFieldCompanyControllerValidator;
  // State field(s) for TextField_RecruiterName widget.
  FocusNode? textFieldRecruiterNameFocusNode;
  TextEditingController? textFieldRecruiterNameController;
  String? Function(BuildContext, String?)?
      textFieldRecruiterNameControllerValidator;
  // State field(s) for DropDown_Approach widget.
  String? dropDownApproachValue;
  FormFieldController<String>? dropDownApproachValueController;
  // State field(s) for TextField_BotPers widget.
  FocusNode? textFieldBotPersFocusNode;
  TextEditingController? textFieldBotPersController;
  String? Function(BuildContext, String?)? textFieldBotPersControllerValidator;
  // State field(s) for TextField_CandName widget.
  FocusNode? textFieldCandNameFocusNode;
  TextEditingController? textFieldCandNameController;
  String? Function(BuildContext, String?)? textFieldCandNameControllerValidator;
  // State field(s) for TextField_CandAge widget.
  FocusNode? textFieldCandAgeFocusNode;
  TextEditingController? textFieldCandAgeController;
  String? Function(BuildContext, String?)? textFieldCandAgeControllerValidator;
  // State field(s) for DropDownCandGender widget.
  String? dropDownCandGenderValue;
  FormFieldController<String>? dropDownCandGenderValueController;
  // State field(s) for TextField_CandPers widget.
  FocusNode? textFieldCandPersFocusNode;
  TextEditingController? textFieldCandPersController;
  String? Function(BuildContext, String?)? textFieldCandPersControllerValidator;
  // State field(s) for TextField_CV widget.
  FocusNode? textFieldCVFocusNode;
  TextEditingController? textFieldCVController;
  String? Function(BuildContext, String?)? textFieldCVControllerValidator;
  // State field(s) for TextField_JobTitle widget.
  FocusNode? textFieldJobTitleFocusNode;
  TextEditingController? textFieldJobTitleController;
  String? Function(BuildContext, String?)? textFieldJobTitleControllerValidator;
  // State field(s) for TextField_JobDesc widget.
  FocusNode? textFieldJobDescFocusNode;
  TextEditingController? textFieldJobDescController;
  String? Function(BuildContext, String?)? textFieldJobDescControllerValidator;
  // State field(s) for TextField_Skills widget.
  FocusNode? textFieldSkillsFocusNode;
  TextEditingController? textFieldSkillsController;
  String? Function(BuildContext, String?)? textFieldSkillsControllerValidator;
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
    textFieldCompanyFocusNode?.dispose();
    textFieldCompanyController?.dispose();

    textFieldRecruiterNameFocusNode?.dispose();
    textFieldRecruiterNameController?.dispose();

    textFieldBotPersFocusNode?.dispose();
    textFieldBotPersController?.dispose();

    textFieldCandNameFocusNode?.dispose();
    textFieldCandNameController?.dispose();

    textFieldCandAgeFocusNode?.dispose();
    textFieldCandAgeController?.dispose();

    textFieldCandPersFocusNode?.dispose();
    textFieldCandPersController?.dispose();

    textFieldCVFocusNode?.dispose();
    textFieldCVController?.dispose();

    textFieldJobTitleFocusNode?.dispose();
    textFieldJobTitleController?.dispose();

    textFieldJobDescFocusNode?.dispose();
    textFieldJobDescController?.dispose();

    textFieldSkillsFocusNode?.dispose();
    textFieldSkillsController?.dispose();

    simulMsgs?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
