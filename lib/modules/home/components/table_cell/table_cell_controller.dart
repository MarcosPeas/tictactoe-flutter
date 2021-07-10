import 'package:rx_notifier/rx_notifier.dart';

class TableCellController {
  int? x;
  int? y;
  var  highlight = RxNotifier<bool>(false);
  var char = RxNotifier<String>('');
}
