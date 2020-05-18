import 'package:flutter/material.dart';
import 'constants.dart';

class FancyButton extends StatelessWidget {
  FancyButton({this.icon, this.label, @required this.onPressed});
  final IconData icon;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        fillColor: kscaffoldcolor,
        splashColor: kcardColor,
        shape: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.pinkAccent,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      );
  }
}