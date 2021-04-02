import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/service/story_service.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class Wizard2Screen extends StatefulWidget {
  Wizard2Screen({
    Key key,
  }) : super(key: key);

  @override
  _Wizard2State createState() => _Wizard2State();
}

class _Wizard2State extends State<Wizard2Screen> {
  Messages get m => context.watchMessages;
  TextEditingController _controller = TextEditingController();

  void initState() {
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = context.watchState<ItemState>();
    if (_controller.text != item.info) {
      _controller.value = TextEditingValue(text: item.info);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${m.wizard.step2title}"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(m.numberTitle),
              TextField(
                controller: _controller,
                onChanged: _updateInfo,
                onSubmitted: _updateInfo,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    child: Text(m.finish.toUpperCase()),
                    onPressed: _next,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _next() async {
    Navigator.pop(context, StoryEnding.save);
  }

  void _updateInfo(String newInfo) {
    var holder = context.getStateHolder<ItemState>();
    holder.state = holder.state.rebuild((b) => b..info = newInfo);
  }
}
