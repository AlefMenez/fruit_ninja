import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:fruit_ninja/src/components/back_button.dart';
import 'package:fruit_ninja/src/components/pause_button.dart';
import 'package:fruit_ninja/src/game.dart';

class GamePage extends Component with DragCallbacks, HasGameReference<Game> {
  @override
  FutureOr<void> onLoad() async{
    await super.onLoad();

    addAll([
      BackButton(),
      PauseButton(),
    ]);
  }
}
