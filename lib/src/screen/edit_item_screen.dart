import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/service/story_service.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen({
    Key key,
  }) : super(key: key);

  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItemScreen> {
  Messages get m => context.watchMessages;
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = context.watchState<ItemState>();
    if (_controller.text != item.name) {
      _controller.value = TextEditingValue(text: item.name);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${item.index} ${item.name}"),
        actions: <Widget>[
          TextButton(
            child: Text(m.delete.toUpperCase(), style: TextStyle(color: Colors.white)),
            onPressed: () {
              _delete(context);
            },
          ),
          TextButton(
            child: Text(m.save.toUpperCase(), style: TextStyle(color: Colors.white)),
            onPressed: () {
              _save(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(m.nameTitle),
              TextField(
                controller: _controller,
                onChanged: _updateName,
                onSubmitted: _updateName,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateName(String newName) {
    var holder = context.getStateHolder<ItemState>();
    holder.state = holder.state.rebuild((b) => b..name = newName);
  }

  void _save(BuildContext context) {
    Navigator.pop(context, StoryEnding.save);
  }

  void _delete(BuildContext context) {
    Navigator.pop(context, StoryEnding.delete);
  }
}
