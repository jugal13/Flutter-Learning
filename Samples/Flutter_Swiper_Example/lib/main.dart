import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Flutter Swiper Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Swiper Demo',
          ),
        ),
        body: CustomSwiper(),
      ),
    );
  }
}

class CustomSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: 100,
        child: Swiper(
          itemWidth: width,
          itemHeight: 100,
          itemCount: 5,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Container(
              padding: EdgeInsets.only(bottom: 25),
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
          layout: SwiperLayout.CUSTOM,
          customLayoutOption: CustomLayoutOption(
            startIndex: -1,
            stateCount: 3,
          ).addTranslate(
            [
              Offset(-width - 10, 0),
              Offset(0, 0),
              Offset(width + 10, 0),
            ],
          ).addRotate(
            [
              -90 / 30,
              0,
              90 / 30,
            ],
          ),
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(
              5,
            ),
            builder: DotSwiperPaginationBuilder(
              activeColor: Colors.blueAccent,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
