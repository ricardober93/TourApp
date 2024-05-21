import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizedContainer extends StatelessWidget {

   const SizedContainer({super.key , required this.child });

  final Widget child;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Center(child: child),
    );
  }

}