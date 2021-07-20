class TextStream {
  static final TextStream _textStream = new TextStream._internal();
  
  List<String> text;

  factory TextStream() {
    return _textStream;
  }

  TextStream._internal();

  Stream<List<String>> get contactListNow async* {
    for (int i = 0; i < text.length; i++) {
      // await Future.delayed(Duration(seconds: 2));
      yield text.sublist(0, i+1);
    }
  }
  
}

final textStream = TextStream();