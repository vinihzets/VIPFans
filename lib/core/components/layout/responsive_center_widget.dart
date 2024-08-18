import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveCenterWidget extends StatelessWidget {
  final Widget child;
  final bool responsive;
  final bool noCenter;

  const ResponsiveCenterWidget({
    super.key,
    required this.child,
    this.responsive = true,
    this.noCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return Center(child: child);
    }

    final size = MediaQuery.of(context).size;

    double map(
      double x,
      double inMin,
      double inMax,
      double outMin,
      double outMax,
    ) {
      return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
    }

    return LayoutBuilder(
      builder: (context, constrains) {
        var currentWidth = size.width;
        var minDelta = 0.6;

        var width = (currentWidth * minDelta);

        if (responsive) {
          final minWidth = constrains.smallest.width;
          final maxWidth = View.of(context).display.size.width;

          var maxDelta = 0.7;

          var delta = map(currentWidth, minWidth, maxWidth, minDelta, maxDelta);
          var reverse = map(delta, minDelta, maxDelta, maxDelta, minDelta);
          width = (currentWidth * reverse);
        }
        if (noCenter) {
          return SizedBox(
            width: width,
            child: child,
          );
        }

        return Center(
          child: SizedBox(
            width: width,
            child: child,
          ),
        );
      },
    );
  }
}
