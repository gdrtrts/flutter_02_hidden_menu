import 'package:fancy_hidden_menu/core/enums/enum.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  BoxScrollDirection _scroll;
  BoxScrollDirection get scroll => _scroll;

  void setScrollDirection(BoxScrollDirection scroll) {
    _scroll = scroll;
    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
