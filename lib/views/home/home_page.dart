import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:maine/controllers/remainder_controller.dart';
import 'package:maine/models/remainder_model.dart';
import 'package:maine/shared/styles.dart';
import 'package:maine/utils/constants.dart';
import 'package:maine/views/remainder/remainder.dart';

class HomePage extends StatelessWidget {
  final RemainderController remainderController =
      Get.put(RemainderController());
  final log = Logger();
  final GetStorage storage = GetStorage();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _random = Random();
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: GestureDetector(
        onLongPress: () => Get.changeTheme(
            Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
        child: FloatingActionButton(
          child: Get.isDarkMode
              ? const Icon(Icons.nightlight)
              : const Icon(Icons.add),
          onPressed: () {
            Get.to(() => Remainder());
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Your remainders",
                  style: MaineStyles.headingBlack1,
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (RemainderModel remainder
                            in remainderController.remainderList)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text(remainder.remainderTitle!),
                              subtitle: Text(
                                remainder.remainderDescription!,
                              ),
                              tileColor: Colors.primaries[
                                      _random.nextInt(Colors.primaries.length)]
                                  [_random.nextInt(9) * 100],
                            ),
                          )
                      ])),
            ]),
          ),
        ),
      ),
    );
  }
}
