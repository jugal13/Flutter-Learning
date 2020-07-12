import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: CarouselWidget(),
    );
  }
}

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<MaterialColor> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.amber,
    Colors.cyan
  ];

  PageController _pageController;
  ValueNotifier<int> _pageNumber;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 10000);
    _pageNumber = ValueNotifier<int>(10000);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: previousSlide,
                child: Icon(
                  Icons.arrow_left,
                  size: 50,
                ),
              ),
            ),
            Container(
              width: width - 100,
              height: width < 600 ? width - 100 :height - 200,
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (BuildContext context, int idx) {
                  int index = getRealIndex(idx);
                  return Container(
                    color: _colors[index],
                  );
                },
                onPageChanged: (index) {
                  _pageNumber.value = index;
                },
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: nextSlide,
                child: Icon(
                  Icons.arrow_right,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void previousSlide() {
    _pageNumber.value -= 1;
    _pageController.animateToPage(
      _pageNumber.value,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void nextSlide() {
    _pageNumber.value += 1;
    _pageController.animateToPage(
      _pageNumber.value,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  int getRealIndex(int idx) {
    int index = (idx - 10000) % _colors.length;
    return index;
  }
}

