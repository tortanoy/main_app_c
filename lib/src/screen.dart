import 'package:flutter/material.dart';

class Screen {
  late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;
  static late double devicePixelRatio;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double fontTextScaleLimit;
  static late double fontTextScaleLimit1dot3;

  static double gridRatio = 0.6982;

  Screen(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (width - _safeAreaHorizontal) / 100;
    safeBlockVertical = (height - _safeAreaVertical) / 100;

    fontTextScaleLimit =
        _mediaQueryData.textScaleFactor > 1.2 ? 1.1 : _mediaQueryData.textScaleFactor;
    fontTextScaleLimit1dot3 =
        _mediaQueryData.textScaleFactor > 1.3 ? 1.3 : _mediaQueryData.textScaleFactor;
  }

  static double convertWidthSize(double sizeFormDesign) {
    return Screen.width * (sizeFormDesign / 375.0);
  }

  static double convertHeightSize(double sizeFormDesign) {
    if (Screen.width > 600) {
      return sizeFormDesign;
    } else {
      return Screen.width / findRatioScreen(sizeFormDesign);
    }
  }

  static double findRatioScreen(double height) {
    //default width form design
    return 375.0 / height;
  }

  static double findRatioPixelScreen(double height) {
    var heightResult = convertHeightSize(height);
    return (Screen.width / 3) / heightResult;
  }

  static double findRatioPixelScreen4Item(double height) {
    var heightResult = convertHeightSize(height);
    return (Screen.width / 4) / heightResult;
  }

  static double ratio() {
    return Screen.width / Screen.height;
  }

  static double widthGrid3() {
    return Screen.width - convertWidthSize(20) / 3;
  }
}
