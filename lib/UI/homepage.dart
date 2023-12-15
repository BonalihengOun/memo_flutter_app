import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/UI/NoteScreen.dart';
import 'package:memo_flutter_projects/constant/colors.dart';
import 'package:memo_flutter_projects/model/noted_model.dart';
import 'package:memo_flutter_projects/service/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int note_length = 0;
  late List<Noted> notedList = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      notedList = await Api.getNote();
      setState(() {
        note_length = notedList.length;
      });
      print('Received data: $notedList');
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.bgcolor,
        body: Column(
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
                    "Your \nProjects(${note_length})",
                    style: TextStyle(fontFamily: 'NiraBold', fontSize: 40),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: FutureBuilder<List<Noted>>(
                    future: Api.getNote(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Noted>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Noted> ndata = snapshot.data!;
                        return ListView.builder(
                          itemCount: ndata.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: AppStyle.bgcolor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('lib/assets/image/bg.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ndata[index].title,
                                        style: TextStyle(
                                            fontFamily: 'NiraBold',
                                            color: Colors.black,
                                            fontSize: 18),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          ndata[index].note,
                                          style: TextStyle(
                                              wordSpacing: 1,
                                              height: 1.8,
                                              fontFamily: 'NiraRegular',
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.75, bottom: 10),
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
