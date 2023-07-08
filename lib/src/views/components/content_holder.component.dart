import 'package:flutter/material.dart';

class ComponentHolder extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;
  final double height;

  ComponentHolder({
    required this.children,
    this.backgroundColor = const Color.fromRGBO(60, 78, 92, 0.698),
    this.height = 180.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(bottom: 16.0),
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
