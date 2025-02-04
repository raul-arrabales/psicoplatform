import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'mi_perfil_widget.dart' show MiPerfilWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MiPerfilModel extends FlutterFlowModel<MiPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for CheckboxEmailVerify widget.
  bool? checkboxEmailVerifyValue;
  // State field(s) for TextField_DisplayName widget.
  FocusNode? textFieldDisplayNameFocusNode;
  TextEditingController? textFieldDisplayNameController;
  String? Function(BuildContext, String?)?
      textFieldDisplayNameControllerValidator;
  // State field(s) for TextField_Genero widget.
  FocusNode? textFieldGeneroFocusNode;
  TextEditingController? textFieldGeneroController;
  String? Function(BuildContext, String?)? textFieldGeneroControllerValidator;
  // State field(s) for TextField_Birth widget.
  FocusNode? textFieldBirthFocusNode1;
  TextEditingController? textFieldBirthController1;
  String? Function(BuildContext, String?)? textFieldBirthController1Validator;
  // State field(s) for TextField_Birth widget.
  FocusNode? textFieldBirthFocusNode2;
  TextEditingController? textFieldBirthController2;
  String? Function(BuildContext, String?)? textFieldBirthController2Validator;
  // State field(s) for DropDownSubs widget.
  String? dropDownSubsValue;
  FormFieldController<String>? dropDownSubsValueController;
  // State field(s) for TextField_Code widget.
  FocusNode? textFieldCodeFocusNode;
  TextEditingController? textFieldCodeController;
  String? Function(BuildContext, String?)? textFieldCodeControllerValidator;
  // State field(s) for DropDownUsrTypes widget.
  String? dropDownUsrTypesValue;
  FormFieldController<String>? dropDownUsrTypesValueController;
  // State field(s) for CheckboxGroupChatBots widget.
  List<String>? checkboxGroupChatBotsValues;
  FormFieldController<List<String>>? checkboxGroupChatBotsValueController;
  // Stores action output result for [Custom Action - getBotRefsFromNames] action in ButtonAssignChatBots widget.
  List<DocumentReference>? botDocsIds;
  // State field(s) for CheckboxGroupSuperBots widget.
  List<String>? checkboxGroupSuperBotsValues;
  FormFieldController<List<String>>? checkboxGroupSuperBotsValueController;
  // Stores action output result for [Custom Action - getBotRefsFromNames] action in ButtonAssignSuperBots widget.
  List<DocumentReference>? superBotDocsIds;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldDisplayNameFocusNode?.dispose();
    textFieldDisplayNameController?.dispose();

    textFieldGeneroFocusNode?.dispose();
    textFieldGeneroController?.dispose();

    textFieldBirthFocusNode1?.dispose();
    textFieldBirthController1?.dispose();

    textFieldBirthFocusNode2?.dispose();
    textFieldBirthController2?.dispose();

    textFieldCodeFocusNode?.dispose();
    textFieldCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
