import 'dart:io';

import 'package:cp_project/controller/state_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SubmissonScreen extends StatelessWidget {
  final int index;
  SubmissonScreen({
    super.key,
    required this.index,
  });
  late DropzoneViewController controller;
  late DropzoneViewController controller_2;
  StateController stateController = Get.find<StateController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 79, 6, 6),
                  Color.fromARGB(255, 234, 34, 20)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Padding(
              padding: EdgeInsets.only(left: 100, top: 100),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(index == 0
                          ? "assets/brain.jpeg"
                          : index == 1
                              ? "assets/Lung_Cancer.jpeg"
                              : "assets/tb.jpeg")),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 410, top: 160),
            child: Text(
              index == 0
                  ? "Malaria"
                  : index == 1
                      ? "Thyroid"
                      : "Glaucoma",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
          index == 0
              ? Padding(
                  padding: EdgeInsets.only(
                      left: 40, top: 400, right: 40, bottom: 40),
                  child: Obx(
                    () => !stateController.hasDropped_malaria.value
                        ? Column(
                            children: [
                              Container(
                                height: 200,
                                child: DottedBorder(
                                  strokeWidth: 3,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(12),
                                  dashPattern: [6, 6, 6, 6],
                                  color: Colors.amber,
                                  child: Stack(
                                    children: [
                                      DropzoneView(
                                        operation: DragOperation.copy,
                                        cursor: CursorType.grab,
                                        onCreated:
                                            (DropzoneViewController ctrl) =>
                                                controller = ctrl,
                                        onLoaded: () => print('Zone loaded'),
                                        onError: (String? ev) =>
                                            print('Error: $ev'),
                                        onHover: () => {
                                          stateController.isHovering.value =
                                              true
                                        },
                                        onDrop: (dynamic ev) async => {
                                          stateController.isHovering.value =
                                              false,
                                          print("hello"),
                                          if (await controller
                                                  .getFileMIME(ev) ==
                                              "image/png")
                                            {
                                              stateController
                                                      .displayString_malaria
                                                      .value =
                                                  'Dropped file ${await controller.getFilename(ev)}',
                                              stateController.hasDropped_malaria
                                                  .value = true
                                            }
                                        },
                                        onDropMultiple: (List<dynamic>? ev) =>
                                            print('Drop multiple: $ev'),
                                        onLeave: () => {
                                          stateController.isHovering.value =
                                              false
                                        },
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Obx(
                                            () => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.file_upload_outlined,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  stateController
                                                      .displayString_malaria
                                                      .value,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          )),
                                      stateController.isHovering.value
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color.fromARGB(
                                                    49, 253, 253, 253),
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 55,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: const Divider(
                                      height: 20,
                                      thickness: 0.5,
                                      indent: 20,
                                      endIndent: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "OR",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: const Divider(
                                      height: 20,
                                      thickness: 0.5,
                                      indent: 20,
                                      endIndent: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Container(
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();
                                        // File file =
                                        //     File(result!.files.single.path!);
                                        stateController
                                                .displayString_malaria.value =
                                            'Recieved file ${result!.files.single.name}';
                                        stateController
                                            .hasDropped_malaria.value = true;
                                      },
                                      child: const Text(
                                        "Choose From Device",
                                      )),
                                ),
                              ))
                            ],
                          )
                        : Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(85, 182, 201, 182),
                              border: Border.all(
                                color: Color.fromARGB(255, 79, 216, 84),
                              ),
                              // borderRadius: BorderRadius.circular(30)
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_copy,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    stateController.displayString_malaria.value,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100, 50),
                                        backgroundColor:
                                            Color.fromARGB(255, 38, 149, 41),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                color: const Color.fromARGB(
                                                    255, 46, 244, 53))),
                                      ),
                                      onPressed: () {
                                        Get.snackbar("Posted to Backend",
                                            "Your Images have been submitted for diagnose");
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100, 50),
                                        backgroundColor:
                                            Color.fromARGB(255, 170, 32, 27),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 244, 46, 46))),
                                      ),
                                      onPressed: () {
                                        stateController.displayString_malaria
                                            .value = 'Drop your file here';
                                        stateController
                                            .hasDropped_malaria.value = false;
                                      },
                                      child: const Text(
                                        "Back",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                ],
                              ),
                            ),
                          ),
                  ),
                )
              : index == 2
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: 40, top: 400, right: 40, bottom: 40),
                      child: Obx(
                        () => !stateController.hasDropped_glucoama.value
                            ? Column(
                                children: [
                                  Container(
                                    height: 200,
                                    child: DottedBorder(
                                      strokeWidth: 3,
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(12),
                                      dashPattern: [6, 6, 6, 6],
                                      color: Colors.amber,
                                      child: Stack(
                                        children: [
                                          DropzoneView(
                                            operation: DragOperation.copy,
                                            cursor: CursorType.grab,
                                            onCreated:
                                                (DropzoneViewController ctrl) =>
                                                    controller_2 = ctrl,
                                            onLoaded: () =>
                                                print('Zone loaded'),
                                            onError: (String? ev) =>
                                                print('Error: $ev'),
                                            onHover: () => {
                                              stateController.isHovering.value =
                                                  true
                                            },
                                            onDrop: (dynamic ev) async => {
                                              stateController.isHovering.value =
                                                  false,
                                              print("hello"),
                                              if (await controller_2
                                                      .getFileMIME(ev) ==
                                                  "image/png")
                                                {
                                                  stateController
                                                          .displayString_glucaoma
                                                          .value =
                                                      'Dropped file ${await controller_2.getFilename(ev)}',
                                                  stateController
                                                      .hasDropped_glucoama
                                                      .value = true
                                                }
                                            },
                                            onDropMultiple:
                                                (List<dynamic>? ev) =>
                                                    print('Drop multiple: $ev'),
                                            onLeave: () => {
                                              stateController.isHovering.value =
                                                  false
                                            },
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Obx(
                                                () => Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .file_upload_outlined,
                                                      color: Colors.white,
                                                      size: 35,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      stateController
                                                          .displayString_glucaoma
                                                          .value,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          stateController.isHovering.value
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color.fromARGB(
                                                        49, 253, 253, 253),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 55,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: const Divider(
                                          height: 20,
                                          thickness: 0.5,
                                          indent: 20,
                                          endIndent: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "OR",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: const Divider(
                                          height: 20,
                                          thickness: 0.5,
                                          indent: 20,
                                          endIndent: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Center(
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            // File file =
                                            //     File(result!.files.single.path!);
                                            stateController
                                                    .displayString_glucaoma
                                                    .value =
                                                'Recieved file ${result!.files.single.name}';
                                            stateController.hasDropped_glucoama
                                                .value = true;
                                          },
                                          child: const Text(
                                            "Choose From Device",
                                          )),
                                    ),
                                  ))
                                ],
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(85, 182, 201, 182),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 79, 216, 84),
                                  ),
                                  // borderRadius: BorderRadius.circular(30)
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.file_copy,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        stateController
                                            .displayString_glucaoma.value,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100, 50),
                                            backgroundColor: Color.fromARGB(
                                                255, 38, 149, 41),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                    color: const Color.fromARGB(
                                                        255, 46, 244, 53))),
                                          ),
                                          onPressed: () {
                                            Get.snackbar("Posted to Backend",
                                                "Your Images have been submitted for diagnose");
                                          },
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100, 50),
                                            backgroundColor: Color.fromARGB(
                                                255, 170, 32, 27),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 244, 46, 46))),
                                          ),
                                          onPressed: () {
                                            stateController
                                                .displayString_glucaoma
                                                .value = 'Drop your file here';
                                            stateController.hasDropped_glucoama
                                                .value = false;
                                          },
                                          child: const Text(
                                            "Back",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          left: 40, top: 400, right: 40, bottom: 40),
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(children: [
                            Text(
                              "Scroll to fill out the entire form",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: stateController.ageController,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                                cursorColor: Colors.amber,
                                minLines: 1,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    if (value.length < 80) {
                                      return null;
                                    } else {
                                      return "Name can't be longer than 80 chars";
                                    }
                                  }
                                  return "Name is required";
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your age...",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(137, 255, 255, 255)),
                                  filled: true,
                                  fillColor: const Color(0x15FFFFFF),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Toggle Button
                            LiteRollingSwitch(
                              onDoubleTap: () {},
                              onSwipe: () {},
                              onTap: () {},
                              //initial value
                              value: true,
                              textOn: 'Male',
                              textOff: 'Female',
                              colorOn: const Color.fromARGB(255, 0, 193, 200),
                              colorOff: const Color.fromARGB(255, 213, 0, 170),
                              iconOn: Icons.male_rounded,
                              iconOff: Icons.female_rounded,
                              textSize: 16.0,
                              onChanged: (bool state) {
                                stateController.isFemale.value = !state;
                                //Use it to manage the different states
                                print('Current State of SWITCH IS: $state');
                              },
                            ),
                            Obx(
                              () => stateController.isFemale.value
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        LiteRollingSwitch(
                                          width: 180,
                                          onDoubleTap: () {},
                                          onSwipe: () {},
                                          onTap: () {},
                                          //initial value
                                          value: true,
                                          textOff: 'Pregnant',
                                          textOn: 'Not Pregnant',
                                          colorOff:
                                              Color.fromARGB(255, 16, 202, 155),
                                          colorOn: Color.fromARGB(
                                              255, 241, 197, 136),
                                          iconOff: Icons.pregnant_woman_rounded,
                                          iconOn: Icons.woman_rounded,
                                          textSize: 16.0,
                                          onChanged: (bool state) {
                                            //Use it to manage the different states

                                            print(
                                                'Current State of SWITCH IS: $state');
                                          },
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            LiteRollingSwitch(
                              onDoubleTap: () {},
                              onSwipe: () {},
                              onTap: () {},
                              width: 200,
                              //initial value
                              value: true,
                              textOn: 'Thyroidic',
                              textOff: 'Not Thyroidic',
                              colorOn: Color.fromARGB(255, 227, 230, 80),
                              colorOff: Color.fromARGB(255, 224, 144, 41),
                              iconOn: Icons.done,
                              iconOff: Icons.remove_circle_outline,
                              textSize: 16.0,
                              onChanged: (bool state) {
                                //Use it to manage the different states
                                print('Current State of SWITCH IS: $state');
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: stateController.tshController,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                                cursorColor: Colors.amber,
                                minLines: 1,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    if (value.length < 80) {
                                      return null;
                                    } else {
                                      return "Name can't be longer than 80 chars";
                                    }
                                  }
                                  return "Name is required";
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your TSH",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(137, 255, 255, 255)),
                                  filled: true,
                                  fillColor: const Color(0x15FFFFFF),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: stateController.t3Controller,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                                cursorColor: Colors.amber,
                                minLines: 1,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    if (value.length < 80) {
                                      return null;
                                    } else {
                                      return "Name can't be longer than 80 chars";
                                    }
                                  }
                                  return "Name is required";
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your T3",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(137, 255, 255, 255)),
                                  filled: true,
                                  fillColor: const Color(0x15FFFFFF),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: stateController.tt4Controller,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                                cursorColor: Colors.amber,
                                minLines: 1,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    if (value.length < 80) {
                                      return null;
                                    } else {
                                      return "Name can't be longer than 80 chars";
                                    }
                                  }
                                  return "Name is required";
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your TT4",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(137, 255, 255, 255)),
                                  filled: true,
                                  fillColor: const Color(0x15FFFFFF),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: stateController.t4uController,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                                cursorColor: Colors.amber,
                                minLines: 1,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    if (value.length < 80) {
                                      return null;
                                    } else {
                                      return "Name can't be longer than 80 chars";
                                    }
                                  }
                                  return "Name is required";
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your T4U",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(137, 255, 255, 255)),
                                  filled: true,
                                  fillColor: const Color(0x15FFFFFF),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 50),
                                  backgroundColor:
                                      Color.fromARGB(255, 38, 149, 41),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                              255, 46, 244, 53))),
                                ),
                                onPressed: () {
                                  Get.snackbar("Posted to Backend",
                                      "Your Images have been submitted for diagnose");
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ]),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
