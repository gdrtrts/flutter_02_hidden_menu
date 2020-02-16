import 'package:fancy_hidden_menu/core/enums/enum.dart';
import 'package:fancy_hidden_menu/core/viewmodels/home_model.dart';
import 'package:fancy_hidden_menu/ui/shared/globals.dart';
import 'package:fancy_hidden_menu/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: Global.darkBlue,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Stack(
          children: <Widget>[
            AnimatedList(
              key: Global.globalKey,
              initialItemCount: model.listTiles.length,
              itemBuilder: (context, index, animation) {
                bool isLast = index == model.listTiles.length - 1;
                return SlideTransition(
                  position: animation.drive(model.tween),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 300.0 : 0.0),
                    child: MenuListWidget(
                      item: model.listTiles[index],
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onVerticalDragStart: (start) {
                model.verticalDragStart = start.globalPosition.dy;
              },
              onVerticalDragUpdate: (update) {
                if (model.verticalDragStart > update.globalPosition.dy) {
                  model.setScrollDirection(BoxScrollDirection.Up);
                } else {
                  model.setScrollDirection(BoxScrollDirection.Down);
                }
              },
              onVerticalDragEnd: (_) {
                if (model.state == ViewState.Idle) {
                  if (model.scroll == BoxScrollDirection.Down &&
                      !model.isToggled) {
                    print('GOING DOWN');
                    model.toggleMenu(height: height);
                  } else if (model.scroll == BoxScrollDirection.Up &&
                      model.isToggled) {
                    print('GOING UP');
                    model.toggleMenu();
                  }
                }
              },
              child: AnimatedContainer(
                transform: Matrix4.identity()..translate(0.0, model.translateY),
                duration: Duration(milliseconds: 500),
                curve: model.curve,
                child: Screen(
                  builder: (context) => HomeWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
