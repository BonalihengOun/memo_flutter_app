import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/UI/NoteScreen.dart';
import 'package:memo_flutter_projects/constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.bgcolor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image(
                      image: AssetImage('lib/assets/image/menu.png'),
                      width: 25,
                      height: 25,
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image(
                          image: AssetImage('lib/assets/image/search.png'),
                          width: 25,
                          height: 25,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image(
                          image: AssetImage('lib/assets/image/user.png'),
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello! Sir",
                      style: TextStyle(fontFamily: 'NiraRegular', fontSize: 15),
                    ),
                    Text(
                      "Your \nProjects(3)",
                      style: TextStyle(fontFamily: 'NiraBold', fontSize: 40),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.75,
              bottom: MediaQuery.of(context).size.width * 0.050),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotedScreen()));
            },
            foregroundColor: AppStyle.mainColor,
            backgroundColor: AppStyle.mainColor,
            shape: CircleBorder(),
            child: Image.asset(
              'lib/assets/image/add.png',
              width: 18,
              height: 18,
            ),
          ),
        ),
      ),
    );
  }
}
