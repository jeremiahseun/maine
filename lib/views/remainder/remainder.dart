import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maine/controllers/remainder_controller.dart';
import 'package:maine/models/remainder_model.dart';

class Remainder extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final RemainderController remainderController =
      Get.put(RemainderController());
  Remainder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remainder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Type your remainder'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                  hintText: 'Remainder', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                remainderController.addRemainder(textController.text);
                Get.back();
                print(remainderController.remainderList.length);
              },
              child: const Text("Add remainder")),
        ],
      ),
    );
  }
}
