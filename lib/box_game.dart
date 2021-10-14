import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  bool hasWon = false;
  Size? screenSize;

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize!.width, screenSize!.height);
    Paint bgPaint = Paint();
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize!.width / 2;
    double screenCenterY = screenSize!.height / 2;
    Rect boxRect =
        Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
  @override
  void resize(Size size) {
    // TODO: implement resize
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    // handle taps here
    double screenCenterX = screenSize!.width / 2;
    double screenCenterY = screenSize!.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      print('true');
      hasWon = true;
    }
  }
}
