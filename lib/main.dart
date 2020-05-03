import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  double scale = 1;
  double position;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Drawer()
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.photo_camera),
      // ),
      // : Container(),
      body: Stack(
        children: <Widget>[
          Drawer(),
          AnimatedBuilder(
            animation: animationController,
            child: Container(
                child: Main(
              animationController: animationController,
            )),
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(200 * animationController.value)
                  ..scale(1 - (animationController.value * 0.3)),
                alignment: Alignment.centerLeft,
                child: child,
                // scale: scaleAnimation.value,
              );
              // return Transform.translate(
              //   child: child,
              //   offset: Offset(
              //     positionAnimation.value,
              //     0,
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class Main extends StatelessWidget {
  final AnimationController animationController;

  const Main({Key key, this.animationController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (animationController.value > 0) animationController.reverse();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(top: 50, left: 10, right: 20),
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                      'https://picsum.photos/200/300',
                    )),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        animationController.forward();
                      },
                      icon: Icon(Icons.menu),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Hello, ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey),
                      ),
                      Text(
                        "Jeff!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Share with:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        for (var i = 0; i < 7; i++)
                          Positioned(
                            top: 0,
                            left: 20 * i * 1.6,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    'https://picsum.photos/200/300'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Recent photos",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Wrap(
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.spaceEvenly,
                      direction: Axis.horizontal,
                      runSpacing: 20,
                      children: <Widget>[
                        for (var i = 0; i < 8; i++)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 100,
                              child: Image.network(
                                'https://picsum.photos/200/300',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                    )),
              ],
            ),
            Positioned(
              bottom: 30,
              left: (MediaQuery.of(context).size.width / 2) - 38,
              child: FloatingActionButton(
                child: Icon(Icons.camera_alt),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Drawer extends StatelessWidget {
  final AnimationController animationController;

  const Drawer({Key key, this.animationController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150, left: 40),
      color: Color(0xff3fd2c7),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAl

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "About",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.web,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Web",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.work,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Company",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
