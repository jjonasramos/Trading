import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationController {
  
  double duration, lowerBound, upperBound, debugLabel;
  TickerProvider vysinc;

  AnimationController({
    double value,
    this.duration,
    this.debugLabel,
    this.lowerBound: 0.0,
    this.upperBound: 1.0,
    @required TickerProvider vsync,
  });
}