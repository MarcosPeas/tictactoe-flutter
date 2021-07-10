import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/home_module.dart';
import 'package:tictactoe/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SplashPage()),
        ModuleRoute('/home', module: HomeModule(), transition: TransitionType.fadeIn)
      ];
}
