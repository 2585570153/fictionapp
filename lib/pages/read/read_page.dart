import 'package:fictionapp/pages/read/read_bottom_bar.dart';
import 'package:fictionapp/pages/read/read_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class ReadPage extends StatelessWidget {


  String? id;

  ReadPage({Key? key, this.id}) : super(key: key); // 在构造函数中接收 id 参数
  final ReadController controller = Get.put(ReadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Another Screen')),
      body: GetBuilder<ReadController>(
          builder: (controller) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Count from AnotherScreen: ${controller.count}'),
                  ElevatedButton(
                    onPressed: controller.increase,
                    child: Text('Increment from AnotherScreen'),
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: ReadBottomBar()
    );
  }
}
