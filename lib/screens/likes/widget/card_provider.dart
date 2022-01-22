import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivpod/model/user.dart';

final cardProvider = ChangeNotifierProvider.autoDispose((ref) {
  return CardProvider();
});

enum CardStatus { like, dislike, superlike }

class CardProvider extends ChangeNotifier {
  CardProvider() {
    resetUsers();
  }

  List<User> _users = [];
  Offset _position = Offset.zero;
  double _angle = 0;
  bool _isDragging = false;
  Size _screenSize = Size.zero;

  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;
  List<User> get users => _users;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void setUsers(List<User> users) => _users = users;

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
    _isDragging = false;
    notifyListeners();

    final status = getStatus(force: true);

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superlike:
        superlike();
        break;
      default:
        resetPosition();
    }
  }

  double getStatusOpacity() {
    const delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());

    final opacity = pos / delta;
    return min(opacity, 1);
  }

  CardStatus? getStatus({
    bool force = false,
  }) {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;

    if (force) {
      const delta = 100;

      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta / 2 && forceSuperLike) {
        return CardStatus.superlike;
      }
    } else {
      const delta = 20;

      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta / 2 && forceSuperLike) {
        return CardStatus.superlike;
      }
    }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();
    CardStatus.like;
    notifyListeners();
  }

  void dislike() {
    _angle = 20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();
    CardStatus.dislike;
    notifyListeners();
  }

  void superlike() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();
    CardStatus.superlike;
    notifyListeners();
  }

  Future _nextCard() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _users.removeLast();
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  resetUsers() {
    _users.reversed.toList();

    notifyListeners();
  }
}
