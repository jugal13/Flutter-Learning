import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String _title;
  final Function _onTap;

  final TextStyle cardTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color.fromRGBO(0, 0, 0, 0.7),
  );

  final EdgeInsets listPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 4,
  );
  final EdgeInsets cardPadding = EdgeInsets.symmetric(
    vertical: 20,
  );

  CustomCard({
    @required String title,
    @required Function onTap,
  })  : this._title = title,
        this._onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._onTap,
      child: Container(
        padding: listPadding,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: cardPadding,
            child: Center(
              child: Text(this._title, style: cardTextStyle),
            ),
          ),
        ),
      ),
    );
  }
}
