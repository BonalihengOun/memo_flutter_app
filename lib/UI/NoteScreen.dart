import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:memo_flutter_projects/UI/homepage.dart';
import 'package:memo_flutter_projects/constant/colors.dart';
import 'package:memo_flutter_projects/service/api.dart';
import 'package:memo_flutter_projects/widget/description_card.dart';
import 'package:memo_flutter_projects/widget/noted_card.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class NotedScreen extends StatefulWidget {
  const NotedScreen({super.key});

  @override
  State<NotedScreen> createState() => _NotedScreenState();
}

class _NotedScreenState extends State<NotedScreen> {
  Color selectedColor = AppStyle.mainColor;
  bool isFinished = false;
  String _selectedType = "Not Started";
  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  var titlecontroller = TextEditingController();
  var textController = TextEditingController();
  var descriptionController = TextEditingController();

  Color _getFocusColor() {
    switch (_selectedType) {
      case 'Not Started':
        return Colors.yellow;
      case 'In Progress':
        return Colors.blue;
      case 'Done':
        return Colors.green;
      default:
        return Colors.yellow; // Default color if none of the cases match
    }
  }

  DateTime _dateTime = DateTime.now();
  void _showdropdown() {
    showDatePicker(
            initialDate: DateTime.now(),
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
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
                            focusColor: _getFocusColor(),
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.055),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/image/assign.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Assigned',
                          style: TextStyle(
                            fontFamily: 'NiraRegular',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.2),
                      child: Image.asset(
                        'lib/assets/image/user.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: titlecontroller,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'NiraBold',
                        fontSize: 30,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(
                      height: 280,
                      child: TextField(
                        controller: textController,
                        maxLines: 20,
                        maxLength: 200,
                        style: TextStyle(
                          fontFamily: 'NiraRegular',
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          helperMaxLines: 10,
                          hintText: 'Write your note. . .',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.75),
                child: const Column(
                  children: [
                    Text(
                      'Add tags',
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
                                title: Text(
                                  'Pick a color',
                                  style: TextStyle(fontFamily: 'NiraSemi'),
                                ),
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
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.55),
                child: const Text(
                  'Additional Description',
                  style: TextStyle(
                      fontFamily: 'NiraSemi', fontSize: 12, color: Colors.grey),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 20,
                        maxLength: 200,
                        style: const TextStyle(
                          fontFamily: 'NiraRegular',
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          helperMaxLines: 10,
                          hintText: 'Describe your note. . .',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Created',
                      style: TextStyle(
                          fontFamily: 'NiraSemi',
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'Deadline',
                      style: TextStyle(
                          fontFamily: 'NiraSemi',
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: _showdropdown,
                      child: Row(
                        children: [
                          Icon(Icons.date_range),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Date',
                            style: TextStyle(
                                fontFamily: 'NiraSemi',
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 20),
                child: Row(
                  children: [
                    Text(
                      _dateTime.toString(),
                      style: TextStyle(
                          fontFamily: 'NiraSemi',
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: SwipeableButtonView(
                  buttonText: 'Set As Done',
                  buttontextstyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'NiraBold',
                      color: Colors.white),
                  buttonWidget: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 30,
                  ),
                  activeColor: AppStyle.mainColor,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    var data = {
                      "Ntitle": titlecontroller.text,
                      "Nnote": textController.text,
                      "Ndescription": descriptionController.text,
                    };
                    Api.addnote(data);

                    await Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: HomePage()));

                    //TODO: For reverse ripple effect animation
                    setState(() {
                      isFinished = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
