import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:fruit_ninja/src/components/rectangle_test.dart';
import 'package:fruit_ninja/src/config/app_config.dart';

class Game extends FlameGame with DragCallbacks {
  late double maxVerticalVelocity;

  @override
  void onLoad() async {
    await super.onLoad();

    add(RectangleTest(size / 2,
        //Vector2(size.x / 2, size.y),
        pageSize: size,
        velocity: Vector2(0, maxVerticalVelocity)));
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);

    componentsAtPoint(event.canvasPosition).forEach((element) {
      if (element is RectangleTest) {
        element.touchAtPoint(event.canvasPosition);
      }
    });
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    getMaxVerticalVelocity(size);
  }

  void getMaxVerticalVelocity(Vector2 size) {
    maxVerticalVelocity = sqrt(2 *
        (AppConfig.gravity.abs() + AppConfig.acceleration.abs()) *
        (size.y - AppConfig.objSize * 2));
  }
}
