import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:memo_flutter_projects/constant/colors.dart';
import 'package:memo_flutter_projects/widget/noted_card.dart';

class NotedScreen extends StatefulWidget {
  const NotedScreen({super.key});

  @override
  State<NotedScreen> createState() => _NotedScreenState();
}

class _NotedScreenState extends State<NotedScreen> {
  Color selectedColor = AppStyle.mainColor;
  String _selectedType = "Not Started";
  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.bgcolor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyle.mainColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              'lib/assets/image/left-arrow.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyle.mainColor,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'lib/assets/image/dot.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/image/Status.png',
                          width: 14,
                          height: 14,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Status',
                          style: TextStyle(
                            fontFamily: 'NiraRegular',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: DropdownButton<String>(
                            items: ['Not Started', 'In Progress', 'Done']
                                .map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            value: _selectedType,
                            onChanged: (String? newvalue) {
                              setState(() {
                                _selectedType = newvalue!;
                              });
                            },
                            iconEnabledColor: AppStyle.mainColor,
                            isDense: true,
                            underline: Container(),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(12),
                            focusColor: Colors.amber,
                            padding: EdgeInsets.all(8),
                            style: TextStyle(
                                fontFamily: 'NiraRegular',
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6)),
                            hint: Text(
                              'Not Started',
                              style: TextStyle(
                                  fontFamily: 'NiraRegular',
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                            icon: Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              NoteCard(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.7),
                child: const Column(
                  children: [
                    Text(
                      'Select Color',
                      style: TextStyle(
                          fontFamily: 'NiraSemi',
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Pick a color'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: selectedColor,
                                    onColorChanged: changeColor,
                                    showLabel: true,
                                    pickerAreaHeightPercent: 0.8,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Image.asset('lib/assets/image/colorWheel.png'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
