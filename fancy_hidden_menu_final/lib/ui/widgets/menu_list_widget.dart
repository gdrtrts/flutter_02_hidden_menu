import 'package:fancy_hidden_menu/core/models/models.dart';
import 'package:fancy_hidden_menu/core/viewmodels/home_model.dart';
import 'package:fancy_hidden_menu/ui/shared/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuListWidget extends StatelessWidget {
  final MenuData item;
  MenuListWidget({this.item});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final bool isSelected = model.active.name == item.name;
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          model.active = item;
          Future.delayed(Duration(milliseconds: 200), () {
            model.toggleMenu();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                isSelected ? Global.white : Global.lightBlack.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 80,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30.0,
              ),
              Icon(
                item.icon,
                size: 18,
                color: isSelected ? Global.darkBlue : Global.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                item.name,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Global.darkBlue : Global.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
