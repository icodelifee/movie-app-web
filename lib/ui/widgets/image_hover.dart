import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ImageHover extends HookWidget {
  ImageHover({required this.child});
  final Widget child;
  final Offset translate = Offset(0, 0);
  @override
  Widget build(context) {
    final elevation = useState(4.0);
    final scale = useState(1.0);
    return InkWell(
      onTap: () {},
      onHover: (value) {
        if (value) {
          elevation.value = 20.0;
          scale.value = 1.07;
        } else {
          elevation.value = 4.0;
          scale.value = 1.0;
        }
      },
      child: Transform.translate(
        offset: translate,
        child: Transform.scale(
          scale: scale.value,
          child: child,
        ),
      ),
    );
  }
}
