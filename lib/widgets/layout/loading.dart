import 'package:flutter/material.dart';

class AppLoadingScreen extends StatelessWidget {
  final Widget child;

  const AppLoadingScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
          // child: Stack(
          //   fit: StackFit.expand,
          //   children: [
          //     child,
          //     IgnorePointer(
          //       ignoring: !controller.loading,
          //       child: AnimatedOpacity(
          //         opacity: controller.loading ? 1.0 : 0.0,
          //         duration: const Duration(milliseconds: 400),
          //         child: const Scaffold(
          //           backgroundColor: Colors.white70,
          //           body: Center(
          //             child: AppIndicator(),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // )),
        ));
  }
}
