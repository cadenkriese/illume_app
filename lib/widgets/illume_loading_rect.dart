import 'package:flutter/widgets.dart';

/// A rectangle that has a gradient move through it to signify that a field is loading.
class IllumeLoadingRect extends StatefulWidget {
  const IllumeLoadingRect();

  @override
  _IllumeLoadingRectState createState() => _IllumeLoadingRectState();
}

class _IllumeLoadingRectState extends State<IllumeLoadingRect>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(0.1, 0),
            colors: <Color>[
              Color(0xff000000),
              Color(0xff555555),
              Color(0xff000000)
            ],
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            Align(
              alignment: Alignment(_controller.value, 0),
              child: child,
            ),
            Container(color: Color(0xff000000)),
          ],
        );
      },
    );
  }
}
