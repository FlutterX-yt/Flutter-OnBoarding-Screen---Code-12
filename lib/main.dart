import 'package:code/data.dart';
import 'package:code/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Color(0xffE5FDF3),
          body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffE5FDF3),
                  Color(0xffBEFBF7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight
              )
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: _controller,
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              child: Text(
                                "Nature Cart",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff65f4d8),
                                    letterSpacing: 1,
                                    shadows: [
                                      Shadow(
                                          color: Colors.grey.shade300,
                                          offset: Offset(3.0, 3.0),
                                          blurRadius: 3.0),
                                      Shadow(
                                          color: Colors.white,
                                          offset: Offset(-3.0, 3.0),
                                          blurRadius: 3.0),
                                    ],
                                    fontSize: 41),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 300,
                              child: Center(
                                child: Text(details[index].desc,
                                    softWrap: true,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey.shade700)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 40.0, left: 40, right: 40),
                              child: Image.network(
                                details[index].imgUrl,
                                height: 400,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        details[index].title,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 21),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.grey.shade500),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(
                                                3,
                                                (index) => Container(
                                                      height: 5,
                                                      width:
                                                          currentIndex == index
                                                              ? 20
                                                              : 8,
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Color(
                                                              0xff65f4d8)),
                                                    )),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          index == 2
                                              ? GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage()),
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Color(0xff65f4d8),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      child: Text(
                                                        "Next",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 19),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : GestureDetector(
                                                  onTap: () {
                                                    _controller.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.bounceIn);
                                                  },
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Skip",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        Icon(
                                                            Icons.arrow_forward)
                                                      ],
                                                    ),
                                                  ),
                                                )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
