import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/components/table_cell/table_cell_controller.dart';
import 'package:tictactoe/modules/home/home_controller.dart';
import 'package:tictactoe/modules/home/home_page.dart';
import 'package:tictactoe/modules/home/utils/table_mapper.dart';

import 'components/table/table_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeController()),
        Bind((i) => TableMapper()),
        Bind.singleton((i) => TableController()),
        Bind.factory((i) => TableCellController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
      ];
}
