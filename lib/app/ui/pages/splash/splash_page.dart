import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/custom_colors.dart';
import 'controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  static const routerPage = "/splash";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashController>(
      builder: (context, value, child) {
        value.onInit(context);
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg-collage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                width: 250,
                height: 250,
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: white),
                child: Image.asset("assets/play.png"),
              ),
            ),
          ),
        );
      },
    );
  }
}
