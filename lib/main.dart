import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

/*
Código para gerar apps separados por processador
flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(_startApp()));
}

Widget _startApp() => ModularApp(module: AppModule(), child: AppWidget());
