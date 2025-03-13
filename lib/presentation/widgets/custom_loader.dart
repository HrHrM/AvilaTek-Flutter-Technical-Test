import 'package:flutter/material.dart';
import 'package:flutter_test_avilatek/theme/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoader extends StatelessWidget {
  final double size;

  const CustomLoader({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: AppTheme.primaryGradient.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: LoadingAnimationWidget.waveDots(color: Colors.white, size: size),
      ),
    );
  }
}
