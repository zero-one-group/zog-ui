part of 'zero_speed_dial.dart';

/// extension for [FloatingActionButtonLocation]
/// to get alignment of [FloatingActionButton]
/// based on [FloatingActionButtonLocation]
extension _ZeroSpeedDialAlignment on FloatingActionButtonLocation {
  AlignmentGeometry getAlignment() {
    switch (this) {
      case FloatingActionButtonLocation.endContained:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.endDocked:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.endFloat:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.centerDocked:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.centerFloat:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.miniCenterDocked:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.miniCenterFloat:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.miniEndDocked:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.miniEndFloat:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.miniStartDocked:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.miniStartFloat:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.startDocked:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.startFloat:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.endTop:
        return Alignment.centerRight;

      case FloatingActionButtonLocation.centerTop:
        return Alignment.center;

      case FloatingActionButtonLocation.startTop:
        return Alignment.centerLeft;

      default:
        return Alignment.bottomRight;
    }
  }

  bool isTop() {
    switch (this) {
      case FloatingActionButtonLocation.endTop:
        return true;

      case FloatingActionButtonLocation.centerTop:
        return true;

      case FloatingActionButtonLocation.startTop:
        return true;

      default:
        return false;
    }
  }

  bool isLeft() {
    switch (this) {
      case FloatingActionButtonLocation.startDocked:
        return true;

      case FloatingActionButtonLocation.startFloat:
        return true;

      case FloatingActionButtonLocation.miniStartDocked:
        return true;

      case FloatingActionButtonLocation.miniStartFloat:
        return true;

      case FloatingActionButtonLocation.startTop:
        return true;

      default:
        return false;
    }
  }

  bool isCenter() {
    switch (this) {
      case FloatingActionButtonLocation.centerDocked:
        return true;

      case FloatingActionButtonLocation.centerFloat:
        return true;

      case FloatingActionButtonLocation.miniCenterDocked:
        return true;

      case FloatingActionButtonLocation.miniCenterFloat:
        return true;

      case FloatingActionButtonLocation.centerTop:
        return true;

      default:
        return false;
    }
  }
}
