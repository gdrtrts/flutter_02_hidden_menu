import 'package:fancy_hidden_menu/ui/shared/globals.dart';
import 'package:fancy_hidden_menu/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.darkBlue,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Stack(
          children: <Widget>[
            Screen(
              builder: (context) => HomeWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
