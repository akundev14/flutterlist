import 'package:dicoding_sub/detail_page.dart';
import 'package:dicoding_sub/model/data.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps',
      theme: ThemeData(
          primaryColor: Colors.blue),
      home: const ListPage(title: 'Flutter Apps'),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List datas;

  @override
  void initState() {
    datas = getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Data datas) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: const Icon(Icons.article_sharp, color: Colors.white),
          ),
          title: Text(
            datas.judul,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: LinearProgressIndicator(
                      backgroundColor: Colors.white30,
                      value: datas.progress,
                      valueColor: const AlwaysStoppedAnimation(Colors.lightBlue))),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(datas.level,
                        style: const TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(data: datas)));
          },
        );

    Card makeCard(Data datas) => Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.indigo),
            child: makeListTile(datas),
          ),
        );

    final makeBody = ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) {
        return makeCard(datas[index]);
      },
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.indigoAccent,
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(106, 106, 241, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getDatas() {
  return [
    Data(
        judul: "Start With basic",
        level: "Beginner",
        progress: 1,
        harga: 0,
        deskripsi:
            "Dart is a wide language and will take time to master. Before jumping to apps, one should at least learn the basics of the Dart language. If you already know Java, the transition from Java to Dart will be pretty easy! Don’t directly jump to Flutter without knowing Dart"),
    Data(
        judul: "Learn UI Development!",
        level: "Beginner",
        progress: 0.76,
        harga: 10,
        deskripsi:
            "Whenever we start a new language, we need the motivation to learn daily. When we first start with UI development, it gives relief. When the screen of your app 1st pops on your device and it is as expected, that is the time when you feel motivated! Also, there are many issues and errors a developer will face when working with UI Development in Flutter."),
    Data(
        judul: "Learn API Calls",
        level: "Intermediate",
        progress: 0.66,
        harga: 30,
        deskripsi:
            "Once you feel confident with UI Development, you should start with learning API Calls. APIs will always be needed whenever you create any apps. API calls can be done using different packages available like http, dio, retrofit, chopper, etc. The basic one is HTTP and other packages are a wrapper over HTTP with few more functionalities. You can choose any of them, but it's always good to start with http and then any other packages. You can get many fake APIs to integrate with your app from: https://jsonplaceholder.typicode.com"),
    Data(
        judul: "Learn Database Integration  ",
        level: "Intermediate",
        progress: 0.66,
        harga: 35,
        deskripsi:
            "Databases are an integral part of any app. There will always be a need to store certain data from your app. "),
    Data(
        judul: "Learn State Management",
        level: "Advanced",
        progress: 0.30,
        harga: 50,
        deskripsi:
            "State Management is one of the most important concepts in Flutter. When our app grows in size and complexity, it becomes really difficult to manage the state of your screens and application. Let’s say you want to pass data from Page 1 to Page 2. That’s easy. We can pass it during Navigation."),
    Data(
        judul: "Learn Project Structure",
        level: "Advanced",
        progress: 0.60,
        harga: 78,
        deskripsi:
            "Maintaining a Project Structure is really important. It helps newbies to review the code quickly. It also helps to trace the bug easily or add or remove functionality as and when needed without breaking the current functionality. There are many predefined Architectures available like MVVM, MVC, TDD, etc."),
   ];
}
