import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/constant/colors.dart';
import 'package:memo_flutter_projects/widget/noted_card.dart';

class NotedScreen extends StatefulWidget {
  const NotedScreen({super.key});

  @override
  State<NotedScreen> createState() => _NotedScreenState();
}

class _NotedScreenState extends State<NotedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.bgcolor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
              NoteCard(),
            ],
          ),
        ),
      ),
    );
  }
}
