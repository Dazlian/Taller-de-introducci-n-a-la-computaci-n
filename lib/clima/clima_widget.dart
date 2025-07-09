import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'clima_model.dart';
export 'clima_model.dart';

class ClimaWidget extends StatefulWidget {
  const ClimaWidget({super.key});

  static String routeName = 'Clima';
  static String routePath = '/clima';

  @override
  State<ClimaWidget> createState() => _ClimaWidgetState();
}

class _ClimaWidgetState extends State<ClimaWidget> {
  late ClimaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClimaModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'Clima',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
                    child: FlutterFlowWebView(
                      content:
                          '<a class=\"weatherwidget-io\" href=\"https://forecast7.com/es/n31d72n55d99/tacuarembo/\" data-label_1=\"TACUAREMBÓ\" data-label_2=\"Clima\" data-theme=\"original\" data-basecolor=\"#e5fff2\" data-textcolor=\"#57636C\" >TACUAREMBÓ Clima</a>\n<script>\n!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=\'https://weatherwidget.io/js/widget.min.js\';fjs.parentNode.insertBefore(js,fjs);}}(document,\'script\',\'weatherwidget-io-js\');\n</script>',
                      height: 329.4,
                      verticalScroll: false,
                      horizontalScroll: false,
                      html: true,
                    ),
                  ),
                ),
              ),
              FlutterFlowWebView(
                content:
                    '<!-- © wdisseny -->\n<div id=\"contain_moon\" style=\"text-align:center;padding-top:5px;padding-bottom:5px;font-size:18px\">\n  <div style=\"font-weight:bold; color:#A3B1C6;\">Fase lunar</div>\n  <div style=\"margin-top:-7px;margin-bottom:-15px;padding:30px;filter:drop-shadow(0 0 30px hsl(220,100%,15%)); color:#A3B1C6;\"></div>\n  <div style=\"color:#A3B1C6;\">.</div>\n  <div style=\"font-size:small; color:#A3B1C6;\">.</div>\n</div>\n<script>\n(function(){\n  var d = new Date().getDate();\n  var m = document.querySelectorAll(\"#contain_moon div\");\n  var a = new XMLHttpRequest();\n  var url = \"https://www.icalendar37.net/lunar/api/?lang=es&month=\" + (new Date().getMonth() + 1) +\n    \"&year=\" + (new Date().getFullYear()) +\n    \"&size=100&lightColor=rgb(245,245,245)&shadeColor=rgb(18,18,18)&LDZ=\" +\n    new Date(new Date().getFullYear(), new Date().getMonth(), 1) / 1000 + \"\";\n  m[1].style.height = \"100px\";\n  a.onreadystatechange = function() {\n    if (a.readyState == 4 && a.status == 200) {\n      var b = JSON.parse(a.responseText);\n      m[1].innerHTML = b.phase[d].svg;\n      if (typeof moon_widget_loaded == \"function\") moon_widget_loaded(b);\n      m[2].innerHTML = b.phase[d].npWidget;\n      m[3].innerHTML = \"Próxima luna llena<br>\" + b.nextFullMoon;\n      // Colorea los textos generados por el script\n      m[2].style.color = \"#A3B1C6\";\n      m[3].style.color = \"#A3B1C6\";\n    }\n  };\n  a.open(\"GET\", url, true);\n  a.send();\n})();\n</script>\n',
                height: 339.65,
                verticalScroll: false,
                horizontalScroll: false,
                html: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
