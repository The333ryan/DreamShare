import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tip_model.dart';
export 'tip_model.dart';

class TipWidget extends StatefulWidget {
  const TipWidget({
    super.key,
    required this.tipDoc,
  });

  /// Documentationisticalities for tips
  final TipsRecord? tipDoc;

  @override
  State<TipWidget> createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> {
  late TipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Container(
        width: double.infinity,
        height: 103.6,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            Theme.of(context).brightness == Brightness.dark
                ? colorFromCssString(
                    getRemoteConfigString('darkmode_background'),
                    defaultColor: FlutterFlowTheme.of(context).secondary,
                  )
                : colorFromCssString(
                    getRemoteConfigString('button_color_day'),
                    defaultColor: Color(0xFFAACCFF),
                  ),
            FlutterFlowTheme.of(context).secondary,
          ),
          borderRadius: BorderRadius.circular(24.0),
          shape: BoxShape.rectangle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 6.0, 0.0, 0.0),
                          child: Text(
                            'Tip #${valueOrDefault<String>(
                              widget.tipDoc?.number.toString(),
                              '0',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.exo2(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colorFromCssString(
                                            getRemoteConfigString('text_night'),
                                            defaultColor: Color(0xFFAACCFF),
                                          )
                                        : colorFromCssString(
                                            getRemoteConfigString('text_day'),
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                    Color(0xFFAACCFF),
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.tipDoc?.content,
                    'This is the tip.',
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.exo2(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          Theme.of(context).brightness == Brightness.dark
                              ? colorFromCssString(
                                  getRemoteConfigString('text_night'),
                                  defaultColor: Color(0xFFAACCFF),
                                )
                              : colorFromCssString(
                                  getRemoteConfigString('text_day'),
                                  defaultColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                          Color(0xFFAACCFF),
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
