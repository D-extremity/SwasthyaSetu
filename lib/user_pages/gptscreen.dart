import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/palmapi.dart';
import 'package:swasthya_setu/models/chatmodel.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/widgets/sidebar.dart';

class ChatGptScreen extends StatefulWidget {
  final Size size;
  final String userid;
  const ChatGptScreen({super.key, required this.size, required this.userid});

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  final TextEditingController _getUserchat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Sidebar(size: widget.size, userid: widget.userid),
      appBar: AppBar(
        backgroundColor: maingreen,
        centerTitle: true,
        title: Text(
          "AI CHATBOT",
          style: TextStyle(
              color: mainwhite, fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              children: [
                const Text(
                  "",
                  style: TextStyle(color: Colors.green),
                ),
                Container(
                  height: constraints.maxHeight * 0.85,
                  child: ListView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    reverse: false,
                    itemCount: chatDetails.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<Map<String, String>> finalChats = chatDetails;
                      finalChats.reversed;
                      Map<String, String> content = finalChats[index];
                      return Chat(
                        constraints: constraints,
                        content: content,
                      );
                    },
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.09,
                  child: Row(
                    children: [
                      SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: TextField(
                            controller: _getUserchat,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )),
                      Row(
                        children: [
                          SizedBox(
                              width: constraints.maxWidth * 0.15,
                              child: IconButton(
                                  onPressed: () async {
                                    String m = _getUserchat.text;
                                    if (m.isEmpty) {
                                      return;
                                    }
                                    chatDetails
                                        .add({'user': 'human', 'message': m});
                                    setState(() {
                                      _getUserchat.text = "";
                                    });
                                    String s = await makeApiRequest(m);
                                    chatDetails
                                        .add({'user': 'bot', 'message': s});
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: maingreen,
                                    size: constraints.maxWidth * 0.12,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
