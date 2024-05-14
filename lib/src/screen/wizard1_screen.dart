import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/screen/wizard2_screen.dart';
import 'package:flutter_kostlivec/src/service/story_service.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class Wizard1Screen extends StatefulWidget {
  Wizard1Screen({
    Key? key,
  }) : super(key: key);

  @override
  _Wizard1State createState() => _Wizard1State();
}

class _Wizard1State extends State<Wizard1Screen> {
  Messages get m => context.watchMessages;
  TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = context.watchState<ItemState>();
    if (_controller.text != item.name) {
      _controller.value = TextEditingValue(text: item.name!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${m.wizard.step1title}"),
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
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    child: Text(m.next.toUpperCase()),
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
    var holder = context.getStateHolder<ItemState>();

    final StoryEnding? ret = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => holder.provideFor(Wizard2Screen()),
      ),
    );

    if (ret != null) {
      Navigator.pop(context, ret);
    }
  }

  void _updateName(String newName) {
    var holder = context.getStateHolder<ItemState>();
    holder.state = holder.state.copyWith(name: newName);
  }
}
