import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SuccesControlContainer extends StatelessWidget {
  const SuccesControlContainer({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: context.border.normalBorderRadius),
          child: Padding(
            padding: context.padding.low,
            child: Text(
              text,
              style: context.general.textTheme.headlineMedium,
            ),
          )),
    );
  }
}
