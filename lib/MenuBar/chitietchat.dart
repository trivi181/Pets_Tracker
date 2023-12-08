import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thuyngoc/MenuBar/MenuBar.dart';
import 'package:thuyngoc/MenuBar/chat_completion_page.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';

class ChatMessage {
  final bool isSentByUser;
  final String text;
  final String time;

  ChatMessage({required this.isSentByUser, required this.text, required this.time});
}

class ChitietChat extends StatefulWidget {
  const ChitietChat({Key? key});

  @override
  State<ChitietChat> createState() => _ChitietChatState();
}

class _ChitietChatState extends State<ChitietChat> {
  List<ChatMessage> _messages = [];
  ChatGpt chatGpt =
      ChatGpt(apiKey: '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');
  final TextEditingController _textController = TextEditingController();

  List<String> chatSuggestions = [
    'Chào bạn!',
    'Bạn có thể giúp tôi tìm thông tin về thú cưng không?',
    'Cảm ơn!',
    'Điều gì mới?',
    'Có thể bạn giúp tôi với...',
  ];

// Future<void> loadFonts() async {
//   List<Future<dynamic>> futures = [];

//   FontLoader fontLoader = FontLoader('YourVietnameseFont');
//   fontLoader.addFont(rootBundle.load('assets/fonts/YourVietnameseFont.ttf'));
//   futures.add(fontLoader.load());

//   await Future.wait(futures);
// }

 @override
Widget build(BuildContext context) {
  return MaterialApp(
    home: DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 136, 202, 191),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Menu(),
                ),
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tìm hiểu thú cưng',
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                final phoneNumber = '0346676839';
                launch('tel:$phoneNumber');
              },
              child: Container(
                padding: EdgeInsets.all(12),
                
                child: Icon(
                  Icons.phone_in_talk_outlined,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ChatCompletionPage(chatGpt: chatGpt),
          ],
        ),
      ),
    ),
  );
}



  Widget _topChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
 Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Menu(),
              ),
            );                    },
                  ),
              GestureDetector(
                onTap: _clearChat,
                child: Text(
                  'Trò chuyện',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  
                ),
                
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  final phoneNumber = '0346676839';
                  launch('tel:$phoneNumber');
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white24,
                  ),
                  child: Icon(
                    Icons.call,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          color: Colors.white,
        ),
        child: _messages.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/talk.jpg'),
                    SizedBox(height: 10),
                    Text(
                      'Bắt đầu tìm hiểu nào !',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _itemChat(_messages[index]);
                },
              ),
      ),
    );
  }

 Widget _itemChat(ChatMessage message) {
  return Row(
    mainAxisAlignment: message.isSentByUser
        ? MainAxisAlignment.end
        : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Flexible(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: message.isSentByUser
                ? Colors.indigo.shade100
                : Colors.indigo.shade50,
            borderRadius: message.isSentByUser
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
          ),

        ),
      ),
      !message.isSentByUser
          ? Text(
              message.time,
              style: TextStyle(color: Colors.grey.shade400),
            )
          : SizedBox(),
    ],
  );
}




 Widget _fontChat() {
  return Positioned(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: 'Soạn tin nhắn...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send_rounded, color: Color.fromARGB(255, 136, 202, 191)),
                          onPressed: () async {
                            final messageText = _textController.text;
                            if (messageText.isNotEmpty) {
                              _sendMessage(messageText);
                              _autoReply();
                              _textController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (chatSuggestions.isNotEmpty)
            Container(
              height: 50,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chatSuggestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _textController.text = chatSuggestions[index];
                        });
                      },
                      child: Text(
                        chatSuggestions[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    ),
  );
}
 void _sendMessage(String messageText) {
    final currentTime = DateTime.now();
    final formattedTime = "${currentTime.hour}:${currentTime.minute}";
    _messages.add(ChatMessage(
      isSentByUser: true,
      text: messageText,
      time: formattedTime,
    ));
    setState(() {});
  }
  void _clearChat() {
    setState(() {
      _messages.clear();
    });}

  void _autoReply() {
  Future.delayed(Duration(seconds: 2), () {
    final currentTime = DateTime.now();
    final formattedTime = "${currentTime.hour}:${currentTime.minute}";
    final responses = [
      "Vui lòng cung cấp thêm thông tin về thú cưng của bạn để chúng tôi có thể giúp bạn tốt hơn.",
      "Dự kiến chúng tôi sẽ liên hệ với bạn trong vòng 24 giờ. Xin cảm ơn!",
      "Vui lòng cung cấp thông tin cụ thể về nhu cầu và yêu cầu của bạn.",
      "Hãy theo dõi thú cưng của bạn bằng ứng dụng để biết vị trí của họ mọi lúc mọi nơi.",
      "Câu hỏi cụ thể nào bạn muốn đặt cho chúng tôi? Chúng tôi sẽ trả lời sớm nhất có thể."
    ];

    final randomResponse = responses[Random().nextInt(responses.length)];

    _messages.add(ChatMessage(
      isSentByUser: false,
      text: randomResponse,
      time: formattedTime,
    ));

    setState(() {});
  });
}

}

// void _sendMessage(String messageText) async {
//     final currentTime = DateTime.now();
//     final formattedTime = "${currentTime.hour}:${currentTime.minute}";
//     _messages.add(ChatMessage(
//       isSentByUser: true,
//       text: messageText,
//       time: formattedTime,
//     ));
//     setState(() {});

//     try {
//       final gptResponse = await sendToGPT(messageText);

//       final responseTime = DateTime.now();
//       final formattedResponseTime = "${responseTime.hour}:${responseTime.minute}";
//       _messages.add(ChatMessage(
//         isSentByUser: false,
//         text: gptResponse,
//         time: formattedResponseTime,
//       ));

//       setState(() {});
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//   void _clearChat() {
//     setState(() {
//       _messages.clear();
//     });
//   }
// }

class Avatar extends StatelessWidget {
  final double size;
  final String image;
  final EdgeInsets margin;

  Avatar({required this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
// Future<String> sendToGPT(String message) async {
//   final apiKey = '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'; 
//   final apiUrl = 'https://api.openai.com/v1/engines/davinci/completions';

//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Authorization': 'Bearer $apiKey',
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'prompt': message,
//         'max_tokens': 50,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final completion = data['choices'][0]['text'];
//       return completion;
//     } else {
//       throw Exception('Failed to get response from GPT API. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error sending request to GPT API: $e');

//     rethrow;
//   }
// }

