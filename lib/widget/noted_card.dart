import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/constant/colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 125),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
      color: AppStyle.mainColor,
      child: Column(
        children: [
          Container(
            height: 200,
            child: TextField(),
          ),
        ],
      ),
    );
  }
}
