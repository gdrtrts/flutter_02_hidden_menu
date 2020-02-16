import 'package:fancy_hidden_menu/core/models/models.dart';
import 'package:fancy_hidden_menu/core/viewmodels/home_model.dart';
import 'package:fancy_hidden_menu/ui/shared/globals.dart';
import 'package:fancy_hidden_menu/ui/widgets/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeWidget extends Screen {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Text(
      model.active.name,
      style: TextStyle(
        color: Global.darkBlue,
        fontSize: 40.0,
        fontFamily: 'Sf',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
