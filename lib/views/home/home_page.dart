import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:maine/controllers/remainder_controller.dart';
import 'package:maine/controllers/storage_boxes.dart';
import 'package:maine/models/remainder/remainder_model.dart';
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
        appBar: AppBar(
            title: Text(
              "Your remainders",
              style: MaineStyles.headingBlack1,
            ),
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder<Box<RemainderModel>>(
                      valueListenable:
                          StorageBoxes.getRemainders().listenable(),
                      builder: (context, box, child) {
                        final remainders =
                            box.values.toList().cast<RemainderModel>();
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: remainders.length,
                            itemBuilder: (context, i) {
                              // final convertedNumber =
                              //     remainders[i].remainderColor!;
                              // final String one = convertedNumber
                              //     .toRadixString(convertedNumber);
                              // log.d("The String convert is $one");
                              // log.i("The int convert is $convertedNumber");
                              // final int ff = int.parse(one);
                              // log.wtf("Final something $ff");
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                      BottomSheet(
                                        onClosing: () {},
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ListView(
                                              children: [
                                                Text("Edit remainder",
                                                    style: MaineStyles
                                                        .headingBlack2),
                                                const SizedBox(height: 20),
                                                Text("Remainder name",
                                                    style: MaineStyles
                                                        .normalBlack1),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: TextField(
                                                    controller:
                                                        TextEditingController(
                                                            text: remainders[i]
                                                                .remainderTitle),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText:
                                                          "Remainder name",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Text("Remainder Description",
                                                    style: MaineStyles
                                                        .normalBlack1),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: TextField(
                                                    controller:
                                                        TextEditingController(
                                                            text: remainders[i]
                                                                .remainderDescription),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText:
                                                          "Remainder Description",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 40),
                                                ElevatedButton(
                                                    onPressed: () =>
                                                        remainderController
                                                            .editRemainder(
                                                                remainders[i]),
                                                    child: const Text("Update"))
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  onLongPress: () {
                                    Get.dialog(AlertDialog(
                                      title: const Text("Delete Remainder"),
                                      content: const Text(
                                          "Are you sure you want to delete this remainder?"),
                                      actions: [
                                        TextButton(
                                          child: const Text("Cancel"),
                                          onPressed: () => Get.back(),
                                        ),
                                        ElevatedButton(
                                          child: const Text("Delete"),
                                          onPressed: () {
                                            remainderController
                                                .removeRemainder(remainders[i]);
                                            Get.snackbar('Maine',
                                                "Remainder removed successfully");
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ));
                                  },
                                  child: Card(
                                    shadowColor: Colors.grey,
                                    child: ListTile(
                                      title:
                                          Text(remainders[i].remainderTitle!),
                                      subtitle: Text(
                                        remainders[i].remainderDescription!,
                                      ),
                                      // tileColor: Color(),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
