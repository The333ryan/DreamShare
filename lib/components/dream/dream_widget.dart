import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dream_model.dart';
export 'dream_model.dart';

class DreamWidget extends StatefulWidget {
  const DreamWidget({
    super.key,
    required this.dreamDoc,
  });

  final DreamsRecord? dreamDoc;

  @override
  State<DreamWidget> createState() => _DreamWidgetState();
}

class _DreamWidgetState extends State<DreamWidget> {
  late DreamModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DreamModel());

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
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.network(
                          currentUserPhoto,
                          width: 35.0,
                          height: 35.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.dreamDoc?.displayName,
                              'Username',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Exo 2',
                                  letterSpacing: 0.0,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Exo 2'),
                                ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            dateTimeFormat("yMd", widget.dreamDoc?.date),
                            '1/1/1900',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Exo 2',
                                letterSpacing: 0.0,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Exo 2'),
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
                    widget.dreamDoc?.dreamDescription,
                    'Description',
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Exo 2',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Exo 2'),
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
