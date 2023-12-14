import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description_card extends StatefulWidget {
  final TextEditingController descriptionController = TextEditingController();
  Description_card({
    Key? key,
    required TextEditingController descriptionController,
  }) : super(key: key);

  @override
  State<Description_card> createState() => _Description_cardState();
}

class _Description_cardState extends State<Description_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              controller: widget.descriptionController,
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
    );
  }
}
