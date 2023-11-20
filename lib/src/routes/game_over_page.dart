import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart' hide Game;
import 'package:flame/rendering.dart';
import 'package:fruit_ninja/src/game.dart';

class GameOverRoute extends Route {
  GameOverRoute() : super(GameOverPage.new, transparent: true);
  @override
  void onPush(Route? previousRoute) {
    previousRoute!
      ..stopTime()
      ..addRenderEffect(
        PaintDecorator.grayscale(opacity: 0.5)..addBlur(3.0),
      );
  }

  @override
  void onPop(Route nextRoute) {
    nextRoute
      ..resumeTime()
      ..removeRenderEffect();
  }
}

class GameOverPage extends Component with TapCallbacks, HasGameReference<Game> {
  late TextComponent _textComponent;

  @override
  FutureOr<void> onLoad() {
    print('pause load');
    final game = findGame()!;
    addAll([
      _textComponent = TextComponent(
          text: 'Game Over',
          position: game.canvasSize / 2,
          anchor: Anchor.center,
          children: [
            ScaleEffect.to(
                Vector2.all(1.1),
                EffectController(
                  duration: 0.3,
                  alternate: true,
                  infinite: true,
                ))
          ])
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _textComponent.position = size / 2;
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) => game.router..pop()..pushNamed('home', replace: true);
}
