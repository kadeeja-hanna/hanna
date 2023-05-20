import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({required Key key, required this.title}) : super(key: key);
//  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String keyWord = "";
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://2.bp.blogspot.com/-xvMmQ3ltZoo/VyxNiWmSgVI/AAAAAAAAA9E/BGlCWMl6GcwMMTFlqIvqyYe1oVNjaI8mwCLcB/s1600/background%2Bkeren%2Buntuk%2Bfoto%2B2.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$keyWord',
                style: TextStyle(color: Colors.deepOrange),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
//vectors
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Search images, vectors",
                  prefixIcon: IconButton(
                      icon: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryPage(
                                      keyWord: keyWord,
                                    )));
                        editingController.text = "";
                      }),
                ),
                onEditingComplete: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryPage(
                                keyWord: keyWord,
                              )));
                  editingController.text = "";
                },
                onChanged: (value) {
                  setState(() {
                    keyWord = value;
                  });
                },
                controller: editingController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
