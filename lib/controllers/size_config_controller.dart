import 'package:flutter/material.dart';

class SizeConfigController {
  static late double _screenHeight;
  static late double _screenWidth;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static late double textSizeMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPotrait = true;
  //is Mobile portrait is for defining the portraiting
  //device is mobile or tab. Because th tab is showing mobiles landscape design in it's portrait mode
  static bool isMobilePotrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
      isPotrait = true;

      if (_screenWidth < 450) {
        isMobilePotrait = true;
      }
    } else {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
      isPotrait = false;
      isMobilePotrait = false;
    }
    _blockHeight = _screenHeight / 100;
    _blockWidth = _screenWidth / 100;
    textSizeMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print('screenWidth: $_screenWidth');
    print('screenHeight: $_screenHeight');
    print('blockHeight: $_blockHeight');
    print('blockWidth: $_blockWidth');
  }
}
