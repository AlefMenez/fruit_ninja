import 'dart:math';

import 'package:flame/components.dart';
import 'package:fruit_ninja/src/config/app_config.dart';

class RectangleTest extends RectangleComponent {
  Vector2 velocity;
  final Vector2 pageSize;
  RectangleTest(
    Vector2 position, {
    required this.pageSize,
    required this.velocity,
  }) : super(
          size: AppConfig.shapeSize,
          position: position,
          anchor: Anchor.center,
        );

  @override
  void update(double dt) {
    super.update(dt);

    angle += .5 * dt;
    angle %= 2 * pi;

    // position +=
    //     Vector2(0, -(velocity.y * dt - .5 * AppConfig.gravity * dt * dt));
    // velocity.y += (AppConfig.acceleration + AppConfig.gravity) * dt;

    // if ((position.y - AppConfig.objSize) > pageSize.y) {
    //   removeFromParent();
    // }

   
  }
   void touchAtPoint(Vector2 vector2) {
      print(vector2);
    }
}
