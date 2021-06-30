import 'package:tictactoe/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SplashPage()),
      ];
}
