import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen({
    Key key,
  }) : super(key: key);

  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItemScreen> {
  Messages get m => getMy<StateHolder<Messages>>().state;
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
    var value = context.watch<StateHolder<ItemState>>();
    var item = value.state;
    if (_controller.text != item.name) {
      _controller.value = TextEditingValue(text: item.name);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${item.index} ${item.name}"),
        actions: <Widget>[
          TextButton(
            child: Text(m.DELETE, style: TextStyle(color: Colors.white)),
            onPressed: () {
              _delete(context);
            },
          ),
          TextButton(
            child: Text(m.SAVE, style: TextStyle(color: Colors.white)),
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
                onChanged: (String t) {
                  _updateName(value, t);
                },
                onSubmitted: (String t) {
                  _updateName(value, t);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateName(StateHolder<ItemState> holder, String t) {
    holder.state = holder.state.rebuild((ItemStateBuilder b) {
      b.replace(holder.state);
      b.name = t;
      return b;
    });
  }

  void _save(BuildContext context) {
    Navigator.pop(context, "SAVE");
  }

  void _delete(BuildContext context) {
    Navigator.pop(context, "DELETE");
  }
}
