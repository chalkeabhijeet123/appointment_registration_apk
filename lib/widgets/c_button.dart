// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.onTap,
    this.title,
    this.color,
  }) : super(key: key);

  final onTap;
  final title;
  final color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: Center(child: Text(title)),
      ),
    );
  }
}
