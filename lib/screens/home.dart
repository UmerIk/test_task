import 'package:flutter/material.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:get/get.dart';
import 'package:test_task/screens/page_two.dart';
import 'package:test_task/state/home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              batteryPercentageWidget(),
              buttonsWidget(),
              toggleWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget batteryPercentageWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: BatteryIndicator(
        style: BatteryIndicatorStyle.skeumorphism,
        batteryLevel: controller.batteryPercentage * 10,
        batteryFromPhone: false,
        colorful: true,
        showPercentNum: true,
        mainColor: Colors.black,
        size: 20.0,
        //ratio between height and width, if h=20, then w= 60, used to define the width according to height
        ratio: 3.0,
        showPercentSlide: true,
      ),
    );
  }

  Widget buttonsWidget() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12,)),
                ),
                onPressed: () {
                  goNext("Relaxation");
                },
                child: const Text(
                  "Relaxation",
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12,)),
                ),
                onPressed: () {
                  goNext("Training");
                },
                child: const Text(
                  "Training",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          onPressed: () {
            goNext("Configure");
          },
          child: const Image(
            image: AssetImage("assets/images/settings.png"),
          ),
        ),
      ],
    );
  }

  Widget toggleWidget() {
    return Obx(() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {
          controller.isConnected.toggle();
        },
        child: Text(controller.isConnected.value ? "Disconnect" : "Connect"),
      );
    });
  }

  goNext(String title){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> SecondScreen(title: title)));
  }
}