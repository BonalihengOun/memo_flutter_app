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
                    "Your \nProjects(3)",
                    style: TextStyle(fontFamily: 'NiraBold', fontSize: 40),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
            ),
            Expanded(
              child: FutureBuilder<List<Noted>>(
                future: Api.getNote(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Noted>> snapshot) {
                  if (snapshot.hasData) {
                    List<Noted> ndata = snapshot.data!;
                    return ListView.builder(
                      itemCount: ndata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(
                            Icons.person_2_rounded,
                            size: 32,
                          ),
                          title: Text(
                            ndata[index].title.toString(),
                            style: TextStyle(
                                fontFamily: 'NiraSemi',
                                color: AppStyle.mainColor),
                          ),
                          subtitle: Text(
                            ndata[index].note.toString(),
                            style: TextStyle(
                                fontFamily: 'NiraSemi',
                                color: AppStyle.mainColor),
                          ),
                          trailing: Text(
                            ndata[index].description.toString(),
                            style: TextStyle(
                                fontFamily: 'NiraSemi',
                                color: AppStyle.mainColor),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: TextStyle(
                          fontFamily: 'NiraSemi',
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
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
