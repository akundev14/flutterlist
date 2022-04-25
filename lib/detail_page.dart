import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'model/data.dart';

class DetailPage extends StatelessWidget {
  final Data data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = LinearProgressIndicator(
        backgroundColor: Colors.white30,
        value: data.progress,
        valueColor: const AlwaysStoppedAnimation(Colors.lightBlueAccent));

    final coursePrice = Container(
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        " Rp " + data.harga.toString(),
        style: const TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 50.0),
        const Icon(
          Icons.account_tree,
          color: Colors.white,
          size: 40.0,
        ),
        const SizedBox(
          width: 90.0,
          child: Divider(color: Colors.lightBlueAccent),
        ),
        const SizedBox(height: 10.0),
        Text(
          data.judul,
          style: const TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      data.level,
                      style: const TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(left: 5.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("flutter.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 25.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText =
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 150,
            child: Text(
              data.deskripsi,
              style: const TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );

    final readButton = Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {
            Fluttertoast.showToast(
                msg: "Learn More\n"+data.judul,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.blue,
                textColor: Colors.black,
                fontSize: 16.0)
          },
          color: const Color.fromRGBO(58, 66, 86, 1.0),
          child:
              const Text("Learn More", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
