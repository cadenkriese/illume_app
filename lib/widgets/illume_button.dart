import 'package:flutter/widgets.dart';

//TODO consider adding long press mode which creates iOS-like context menu and triggers haptic feedback.
/// Based on iOS SwiftUI Button
class IllumeButton extends StatefulWidget {
  @override
  _IllumeButtonState createState() => _IllumeButtonState();
}

class _IllumeButtonState extends State<IllumeButton>
    with SingleTickerProviderStateMixin {
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  //TODO implement spring physics for various fields such as color, blur, rotation, scale.
  // see https://flutter.dev/docs/cookbook/animation/physics-simulation
  //TODO implement constructors for an Icon and a Widget

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  void _setTween() {
    // _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
