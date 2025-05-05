import '/backend/backend.dart';
import '/components/tip/tip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tips_model.dart';
export 'tips_model.dart';

/// Page for dream tips
class TipsWidget extends StatefulWidget {
  const TipsWidget({super.key});

  static String routeName = 'Tips';
  static String routePath = '/tips';

  @override
  State<TipsWidget> createState() => _TipsWidgetState();
}

class _TipsWidgetState extends State<TipsWidget> {
  late TipsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Tips'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: colorFromCssString(
          getRemoteConfigString('lightmode_background'),
          defaultColor: FlutterFlowTheme.of(context).primary,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/DreamshareNightBack.jpg'
                    : 'assets/images/dawid-zawila--G3rw6Y02D0-unsplash.jpg',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 15.0),
                    child: Text(
                      'Tips',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            font: GoogleFonts.exo2(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              Theme.of(context).brightness == Brightness.dark
                                  ? colorFromCssString(
                                      getRemoteConfigString('text_night'),
                                      defaultColor: Color(0xFFAACCFF),
                                    )
                                  : colorFromCssString(
                                      getRemoteConfigString('text_day'),
                                      defaultColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                              Color(0xFFAACCFF),
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .displayLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                StreamBuilder<List<TipsRecord>>(
                  stream: queryTipsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<TipsRecord> listViewTipsRecordList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTipsRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewTipsRecord =
                            listViewTipsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsets.all(6.0),
                          child: StreamBuilder<List<TipsRecord>>(
                            stream: queryTipsRecord(
                              queryBuilder: (tipsRecord) =>
                                  tipsRecord.orderBy('number'),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<TipsRecord> tipTipsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final tipTipsRecord = tipTipsRecordList.isNotEmpty
                                  ? tipTipsRecordList.first
                                  : null;

                              return TipWidget(
                                key: Key(
                                    'Key2pj_${listViewIndex}_of_${listViewTipsRecordList.length}'),
                                tipDoc: tipTipsRecord!,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
