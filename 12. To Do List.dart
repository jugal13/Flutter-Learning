import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController _currentItemController;
  List<ToDoItem> _items;

  @override
  void initState() {
    super.initState();
    _currentItemController = TextEditingController();
    _items = [];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth > 450 ? 400 : screenWidth;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _buildTextField,
              Expanded(
                child: _buildListCards,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentItemController.dispose();
    super.dispose();
  }

  Widget get _buildTextField {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'To Do List',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _currentItemController,
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Enter text',
                suffixIcon: GestureDetector(
                  onTap: () {
                    String value = _currentItemController.text;
                    if (value == '' || value == null) {
                      return;
                    }
                    List<String> _currentItems =
                        _items.map((e) => e.text).toList();
                    if (_currentItems.contains(value)) {
                      return;
                    }
                    ToDoItem item = ToDoItem(
                      text: value,
                      isCompleted: false,
                    );
                    _items.add(item);
                    _currentItemController.text = '';
                    setState(() {});
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildListCards {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        ToDoItem current = _items.elementAt(index);
        return Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 16, 16, 16),
            child: Row(
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool value) {
                    current.isCompleted = !current.isCompleted;
                    setState(() {});
                  },
                  value: current.isCompleted,
                ),
                Text(
                  current.text,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: current.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    _items.remove(current);
                    setState(() {});
                  },
                  child: Icon(
                    Icons.delete,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ToDoItem {
  String _text;
  bool _isCompleted;

  ToDoItem({
    String text,
    bool isCompleted,
  })  : this._text = text,
        this._isCompleted = isCompleted;

  String get text => this._text;
  bool get isCompleted => this._isCompleted;

  set isCompleted(bool isCompleted) {
    this._isCompleted = isCompleted;
  }
}

