import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'glowing_button_model.dart';
export 'glowing_button_model.dart';

/// Button that glows (from marketplace)
class GlowingButtonWidget extends StatefulWidget {
  const GlowingButtonWidget({
    super.key,
    String? buttonText,
  }) : this.buttonText = buttonText ?? 'Button Text';

  final String buttonText;

  @override
  State<GlowingButtonWidget> createState() => _GlowingButtonWidgetState();
}

class _GlowingButtonWidgetState extends State<GlowingButtonWidget> {
  late GlowingButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowingButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      constraints: BoxConstraints(
        maxHeight: 56.0,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Color(0x804B39EF),
            offset: Offset(
              0.0,
              9.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(1000.0),
      ),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4.5,
              color: Color(0x4A4B39EF),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(1000.0),
        ),
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 1.5,
                color: Color(0x344B39EF),
                offset: Offset(
                  0.0,
                  0.5,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(1000.0),
          ),
          child: FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: widget.buttonText,
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 56.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Exo 2',
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey('Exo 2'),
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(1000.0),
            ),
          ),
        ),
      ),
    );
  }
}
