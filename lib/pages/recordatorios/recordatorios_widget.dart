import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/descripcion_tarea_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'recordatorios_model.dart';
export 'recordatorios_model.dart';

class RecordatoriosWidget extends StatefulWidget {
  const RecordatoriosWidget({super.key});

  static String routeName = 'Recordatorios';
  static String routePath = '/recordatorios';

  @override
  State<RecordatoriosWidget> createState() => _RecordatoriosWidgetState();
}

class _RecordatoriosWidgetState extends State<RecordatoriosWidget> {
  late RecordatoriosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordatoriosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Recordatorios',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: StreamBuilder<List<TareasRecord>>(
          stream: queryTareasRecord(
            queryBuilder: (tareasRecord) => tareasRecord
                .where(
                  'uid',
                  isEqualTo: currentUserUid,
                )
                .orderBy('DatePicked', descending: true),
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
            List<TareasRecord> listViewTareasRecordList = snapshot.data!;

            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewTareasRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewTareasRecord =
                    listViewTareasRecordList[listViewIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                  child: GestureDetector(
                    onTap: () async {
                      context.pushNamed(
                        EditarWidget.routeName,
                        queryParameters: {
                          'tareaToEdit': serializeParam(
                            listViewTareasRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    onLongPress: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Eliminar Tarea'),
                                  content: Text(
                                      '¿Estás seguro de que deseas eliminar esta tarea?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text(' Eliminar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await listViewTareasRecord.reference.delete();
                        await actions.cancelTaskNotification(
                          listViewTareasRecord.notificationUuid,
                        );
                        FFAppState().refreshTasksList =
                            !(FFAppState().refreshTasksList ?? true);
                        safeSetState(() {});
                      }
                    },
                    onHorizontalDragStart: (details) async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0x00F1F4F8),
                        barrierColor: Colors.transparent,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height: 500.0,
                                  child: DescripcionTareaDialogWidget(
                                    descripcionTexto:
                                        listViewTareasRecord.description,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: Color(0xFFE0E3E7),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Opacity(
                        opacity: listViewTareasRecord.isCompleted ? 0.4 : 1.0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 4.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEE8B60),
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewTareasRecord.task,
                                          'Tarea',
                                        ),
                                        style: GoogleFonts.outfit(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: FFAppState().fontSize,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 50.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "d/M/y",
                                          listViewTareasRecord.datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '--/--/--',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF57636C),
                                            fontSize: FFAppState().fontSize,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.96, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValueMap[
                                            listViewTareasRecord] ??=
                                        listViewTareasRecord.isCompleted,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model
                                              .checkboxValueMap[
                                          listViewTareasRecord] = newValue!);
                                      if (newValue!) {
                                        await listViewTareasRecord.reference
                                            .update(createTareasRecordData(
                                          isCompleted: true,
                                        ));
                                        await actions.cancelTaskNotification(
                                          listViewTareasRecord.notificationUuid,
                                        );
                                      } else {
                                        await listViewTareasRecord.reference
                                            .update(createTareasRecordData(
                                          isCompleted: false,
                                        ));
                                      }
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .primary !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .primary!,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
