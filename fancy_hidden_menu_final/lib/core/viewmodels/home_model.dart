import 'package:fancy_hidden_menu/core/enums/enum.dart';
import 'package:fancy_hidden_menu/core/models/models.dart';
import 'package:fancy_hidden_menu/core/viewmodels/base_model.dart';
import 'package:fancy_hidden_menu/ui/shared/globals.dart';
import 'package:fancy_hidden_menu/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeModel extends BaseModel {
  //PUBLIC
  bool isToggled = false;
  double translateY = 0.0;
  List<MenuData> listTiles = [];
  Curve curve = Curves.easeInOutQuad;

  //GETTERS AND SETTERS
  double _verticalDragStart = 0.0;
  double get verticalDragStart => _verticalDragStart;
  set verticalDragStart(value) {
    _verticalDragStart = value;
    notifyListeners();
  }

  MenuData _active = MenuData.fromMap(Global.menuItems.first);
  MenuData get active => _active;
  set active(MenuData item) {
    _active = item;
    notifyListeners();
  }

  //METHODS
  void getListTiles() {
    listTiles = Global.menuItems.map((item) => MenuData.fromMap(item)).toList();
    notifyListeners();
  }

  void toggleMenu({height}) {
    isToggled = !isToggled;
    getListTiles();
    if (isToggled) {
      translateY = height - 180;
      _uploadItems();
    } else {
      translateY = 0.0;
      _deleteItems();
    }
    notifyListeners();
  }

  Animatable<Offset> get tween => _tween();
  Animatable<Offset> _tween() {
    var begin = Offset(0.0, isToggled ? 1.0 : 2.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return tween;
  }

  void _uploadItems() async {
    setState(ViewState.Busy);
    for (int i = 0; i < Global.menuItems.length; i++) {
      await Future.delayed(
        Duration(milliseconds: 75),
        () {
          Global.globalKey.currentState
              .insertItem(i, duration: Duration(milliseconds: 500));
        },
      );
    }
    setState(ViewState.Idle);
  }

  void _deleteItems() {
    setState(ViewState.Busy);
    for (int i = Global.menuItems.length - 1; i >= 0; i--) {
      final deletedItem = listTiles.removeAt(i);
      Global.globalKey.currentState.removeItem(i, (context, animation) {
        return SlideTransition(
          position: animation.drive(tween),
          child: MenuListWidget(
            item: deletedItem,
          ),
        );
      }, duration: Duration(milliseconds: 500));
    }
    setState(ViewState.Idle);
  }
}
