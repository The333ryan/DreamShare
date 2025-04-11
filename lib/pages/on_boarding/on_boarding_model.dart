import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'on_boarding_widget.dart' show OnBoardingWidget;
import 'package:flutter/material.dart';

class OnBoardingModel extends FlutterFlowModel<OnBoardingWidget> {
  ///  Local state fields for this page.

  String formattedWakeupTime = '\"\"';

  String bedtime = '10:00';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for wakeupTimeField widget.
  FocusNode? wakeupTimeFieldFocusNode;
  TextEditingController? wakeupTimeFieldTextController;
  String? Function(BuildContext, String?)?
      wakeupTimeFieldTextControllerValidator;
  // State field(s) for WakeUpDropDown widget.
  String? wakeUpDropDownValue;
  FormFieldController<String>? wakeUpDropDownValueController;
  // State field(s) for bedTimeField widget.
  FocusNode? bedTimeFieldFocusNode;
  TextEditingController? bedTimeFieldTextController;
  String? Function(BuildContext, String?)? bedTimeFieldTextControllerValidator;
  // State field(s) for BedtimeDropDown widget.
  String? bedtimeDropDownValue;
  FormFieldController<String>? bedtimeDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    wakeupTimeFieldFocusNode?.dispose();
    wakeupTimeFieldTextController?.dispose();

    bedTimeFieldFocusNode?.dispose();
    bedTimeFieldTextController?.dispose();
  }
}
