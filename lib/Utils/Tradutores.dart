import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Temas.dart';
import 'enum.dart';

class Tradutores {
  static Widget definirSpinKit(TipoSpinKit imagenLoading, double size,
      {Color color}) {
    if (color == null) {
      color = Temas.azulPadrao;
    }
    switch (imagenLoading) {
      case TipoSpinKit.pouringHourGlass:
        return SpinKitPouringHourglass(
          color: color,
          size: size,
        );
      case TipoSpinKit.circle:
        return SpinKitCircle(
          color: color,
          size: size,
        );

      case TipoSpinKit.ripple:
        return SpinKitRipple(
          color: color,
          size: size,
        );
      case TipoSpinKit.hourGlass:
        return SpinKitHourGlass(
          color: Temas.azulPadrao,
          size: size,
        );

      case TipoSpinKit.fadingCube:
        return SpinKitFadingCube(
          color: color,
          size: size,
        );

      case TipoSpinKit.chasingDots:
        return SpinKitChasingDots(
          color: color,
          size: size,
        );

      case TipoSpinKit.threeBounce:
        return SpinKitThreeBounce(
          color: color,
          size: size,
        );

      case TipoSpinKit.foldingCube:
        return SpinKitFoldingCube(
          color: color,
          size: size,
        );

      default:
        return SpinKitThreeBounce(
          color: color,
          size: size,
        );
    }
  }
}
