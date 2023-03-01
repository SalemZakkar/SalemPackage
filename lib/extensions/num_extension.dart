import 'package:flutter/cupertino.dart';

extension SpaceExtension on num {
  Widget spaceHeight() => SizedBox(
        height: toDouble(),
      );
  Widget spaceWidth() => SizedBox(
        width: toDouble(),
      );
}
