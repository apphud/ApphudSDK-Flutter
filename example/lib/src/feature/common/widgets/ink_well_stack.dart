import 'package:flutter/material.dart';

class InkWellStack extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const InkWellStack({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
