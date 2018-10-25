import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        appBar: AppBar(
            title: Text("Chat App"),
            centerTitle: true,
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
        body: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: TextComposer())
          ],
        ),
      ),
    );
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isCompose = false;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[200])))
              : null,
          child: Row(
            children: <Widget>[
              Container(
                  child: IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () {},
              )),
              Expanded(
                  child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: "Enviar uma mensagem"),
                      onChanged: (text) {
                        setState(() {
                          _isCompose = text.length > 0;
                        });
                      })),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoButton(
                          child: Text("Enviar"),
                          onPressed: _isCompose ? () {} : null)
                      : IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _isCompose ? () {} : null))
            ],
          ),
        ));
  }
}
