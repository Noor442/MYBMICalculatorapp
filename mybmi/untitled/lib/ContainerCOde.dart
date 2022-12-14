import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RepeatContainer extends StatelessWidget {

  RepeatContainer({required this.colors,  this.cardWidget, this.onPressed});
  final Color colors;
  final Widget ? cardWidget;
  final Function ? onPressed;
  @override
  Widget build(BuildContext context) {
  return GestureDetector(
  onTap: () {
  child: onPressed!();
  },
  child: Container(
  child: cardWidget,
  margin: const EdgeInsets.all(15.0),
  decoration: BoxDecoration(
  color: colors,
  borderRadius: BorderRadius.circular(10.0),
  ),
      ),
    );
  }
}