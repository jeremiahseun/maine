import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maine/controllers/remainder_controller.dart';
import 'package:maine/shared/styles.dart';
import 'package:maine/views/remainder/remainder.dart';

class HomePage extends StatelessWidget {
  final RemainderController remainderController =
      Get.put(RemainderController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _random = Random();
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => Remainder());
        },
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
                        for (final remainder
                            in remainderController.remainderList)
                          Dismissible(
                            key: Key(remainder.hashCode.toString()),
                            background: Container(
                              color: theme.primaryColor,
                              child: const ListTile(
                                leading:
                                    Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            secondaryBackground: Container(
                              color: theme.primaryColor,
                              child: const ListTile(
                                trailing:
                                    Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            onDismissed: (direction) {
                              remainderController.remainderList
                                  .remove(remainder);
                              print(remainderController.remainderList.length);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(remainder),
                                tileColor: Colors.primaries[_random
                                        .nextInt(Colors.primaries.length)]
                                    [_random.nextInt(9) * 100],
                              ),
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
