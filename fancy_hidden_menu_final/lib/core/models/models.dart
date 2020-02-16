import 'package:flutter/cupertino.dart';

class MenuData {
  String name;
  IconData icon;

  MenuData.fromMap(data)
      : this.name = data['name'],
        this.icon = data['icon'];
}
