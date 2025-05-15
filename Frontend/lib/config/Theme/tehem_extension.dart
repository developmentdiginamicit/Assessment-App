import 'package:flutter/material.dart';

// Define a Theme Extension to hold gradient colors
class GradientColors extends ThemeExtension<GradientColors> {
  final Gradient? primaryGradient;
  final Gradient? buttonGradient;
  final Gradient? transparentGradient;

  const GradientColors({
    this.primaryGradient,
    this.buttonGradient,
    this.transparentGradient,
  });

  @override
  GradientColors copyWith({Gradient? appBarGradient, Gradient? buttonGradient}) {
    return GradientColors(
      primaryGradient: appBarGradient ?? primaryGradient,
      buttonGradient: buttonGradient ?? this.buttonGradient,
      transparentGradient: transparentGradient?? transparentGradient
    );
  }

  @override
  GradientColors lerp(ThemeExtension<GradientColors>? other, double t) {
    if (other is! GradientColors) return this;
    return GradientColors(
      primaryGradient: Gradient.lerp(primaryGradient, other.primaryGradient, t),
      buttonGradient: Gradient.lerp(buttonGradient, other.buttonGradient, t),
      transparentGradient: Gradient.lerp(transparentGradient, other.transparentGradient, t),
    );
  }
}
