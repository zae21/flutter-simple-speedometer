import 'package:flutter/material.dart';

String mstoKmh(double speed) {
  double conversion = 3.6;
  double result = speed * conversion;
  return result.toStringAsFixed(2);
}

Color speedColor(double speed) {
  Color result = Colors.white;
  if (speed < 10) {
    result = Colors.white;
  } else if (speed < 40) {
    result = Colors.green;
  } else if (speed < 60) {
    result = Colors.blue;
  } else if (speed < 80) {
    result = Colors.amber;
  } else if (speed > 80) {
    result = Colors.red;
  }
  return result;
}

TextStyle dsStyleText(double? fontSize, double? f) {
  return TextStyle(
      fontFamily: 'DS-Digital',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: speedColor(f!));
}

Widget pageWrapper(
    {PreferredSizeWidget? appBar,
    Widget? child,
    Widget? bottomNav,
    ScrollPhysics? physics}) {
  return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              physics: physics,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: child),
            );
          },
        ),
      ),
      bottomNavigationBar: bottomNav);
}

Container btnLodingIndikator({Color? color}) {
  color = color ?? Colors.white;
  // ignore: avoid_unnecessary_containers
  return Container(
      child: Center(
    child: SizedBox(
      height: 30.0,
      width: 30.0,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    ),
  ));
}
