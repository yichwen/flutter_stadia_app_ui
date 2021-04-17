import 'package:flutter/material.dart';
import 'package:stadia_app/styleguide/colors.dart';

class GameProgressWidget extends StatelessWidget {
  final double screenWidth;
  final double gameProgress;

  const GameProgressWidget({Key key, this.screenWidth, this.gameProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (screenWidth * 0.33);

    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: tertiaryTextColor,
              width: 1,
            ),
          ),
        ),
        Container(
          width: width * gameProgress,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: appGradient,
          ),
        ),
      ],
    );
  }
}
