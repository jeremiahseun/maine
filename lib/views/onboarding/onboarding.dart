import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maine/controllers/home_controller.dart';
import 'package:maine/views/home/home_page.dart';

class Onboarding extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Maine",
                style: theme.textTheme.headline3!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            CircleAvatar(
              maxRadius: 25,
              child: IconButton(
                  onPressed: () => Get.to(() => HomePage()),
                  icon: const Icon(Icons.arrow_forward_ios_sharp)),
            )
          ],
        ),
      ),
    );
  }
}
