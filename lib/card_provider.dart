import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cardProvider = ChangeNotifierProvider.autoDispose((ref) {
  return CardProvider();
});

class CardProvider extends ChangeNotifier {
  Offset _position = Offset.zero;
  double _angle = 0;
  bool _isDragging = false;
  Size _screenSize = Size.zero;

  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }
}
