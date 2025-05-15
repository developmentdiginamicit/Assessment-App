import 'package:flutter/material.dart';

class ExitFromTheAppWidget extends StatefulWidget {
  final Widget child;
  const ExitFromTheAppWidget({super.key, required this.child});

  @override
  State<ExitFromTheAppWidget> createState() => _ExitFromTheAppWidgetState();
}

class _ExitFromTheAppWidgetState extends State<ExitFromTheAppWidget> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final backButtonHasNotBeenPressedOrSnackbarHasBeenShown =
            lastPressed == null ||
                now.difference(lastPressed!) > const Duration(seconds: 2);

        if (backButtonHasNotBeenPressedOrSnackbarHasBeenShown) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );
          return false; // Prevent exit
        }
        return true; // Exit app
      },
      child: widget.child,
    );
  }
}
