import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _open = false;
  bool _marked = false;
  bool _mining = false;
  bool _isBoom = false;

  Field({
    required this.line,
    required this.column,
  });

  void addNeighbor(Field neighbor) {
    final deltaLine = line - neighbor.line;
    final deltaColumn = column - neighbor.column;

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 0) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_open) return;

    _open = true;

    if (_mining) {
      _isBoom = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      neighbors.forEach((element) {
        element.open();
      });
    }
  }

  void showBombs() {
    if (_mining) _open = true;
  }

  void markMining() {
    _mining = true;
  }

  void changeMark() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _mining = false;
    _isBoom = false;
  }

  bool get isBoomGet {
    return _isBoom;
  }

  bool get openGet {
    return _open;
  }

  bool get miningGet {
    return _mining;
  }

  bool get markedGet {
    return _marked;
  }

  bool get solved {
    bool miningAndMarked = _mining && _marked;
    bool safeAndOpen = !miningGet && openGet;

    return miningAndMarked || safeAndOpen;
  }

  bool get safeNeighborhood {
    return neighbors.every((v) => !v._mining);
  }

  int get bombsAround {
    return neighbors.where((element) => element._mining).length;
  }
}
