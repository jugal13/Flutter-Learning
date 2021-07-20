import 'dart:async';

final List<String> CONTACTS = ["USER1","USER2","USER3","USER4"];

class ContactManager {

  Stream<List<String>> get contactListNow async* {
    for ( int i = 0; i < CONTACTS.length; i ++) {
      await Future.delayed(Duration(seconds: 2));
      yield CONTACTS.sublist(0, i+1);
    }
  }

  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }

}