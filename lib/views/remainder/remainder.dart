import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:maine/controllers/remainder_controller.dart';
import 'package:maine/models/remainder/remainder_model.dart';
import 'package:maine/services/notification_service.dart' as notify;
import 'package:maine/shared/styles.dart';
import 'package:maine/utils/constants.dart';

class Remainder extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RemainderController remainderController =
      Get.put(RemainderController());
  final log = Logger();
  final _random = Random();
  final GetStorage storage = GetStorage();
  final constant = MaineConstants();

  Remainder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Remainder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Title of remainder', style: MaineStyles.headingBlack4),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: 'E.g Get a private jet',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: 'E.g Buying a private jet...',
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    remainderController.addRemainder(RemainderModel(
                        remainderColor: 0xff9f7c03,
                        remainderTitle: titleController.text,
                        remainderDescription: descriptionController.text));
                    Get.back();
                    log.i(remainderController.remainderList.toString());
                    Get.snackbar('Maine', 'Added successfully',
                        snackPosition: SnackPosition.TOP);
                    notify.createImportantNotification(
                        titleController.text, descriptionController.text);
                  },
                  child: const Text("Add remainder")),
            ),
          ],
        ),
      ),
    );
  }
}
