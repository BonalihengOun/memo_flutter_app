import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/constant/colors.dart';

class NoteCard extends StatefulWidget {
  NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width * 0.88,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            child: TextField(
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
          ),
          Container(
            height: 280,
            child: TextField(
              controller: textEditingController,
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
    );
  }
}
