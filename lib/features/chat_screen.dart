import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.projectName});
  final String projectName;

  @override
  Widget build(BuildContext context) {
    final myColor = Color(0xFF35B6AD); // same as your "Envoyer" button
    return Scaffold(
      appBar: AppBar(title: Text(projectName)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 12),
                _chatBubble(
                  message: "hahahahahahaha",
                  dateTime: "11 juin, 11:07",
                  isMe: true,
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),
                _chatBubble(
                  name: "Lucas Gabez",
                  initials: "LG",
                  message: "Besoin d'un fichier PDF de toute urgence stp",
                  dateTime: "11 juin, 11:13",
                  isMe: false,
                  blocker: "Isabelle Gabez",
                ),

                const SizedBox(height: 12),
                _replyToMessage(
                  replyText: "En réponse à un message",
                  child: _chatBubble(
                    message: "c'est fait",
                    dateTime: "11 juin, 11:14",
                    isMe: true,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _chatInputBar(myColor),
        ],
      ),
    );
  }

  Widget _chatBubble({
    String? name,
    String? initials,
    required String message,
    required String dateTime,
    required bool isMe,
    String? blocker,
  }) {
    final bubbleColor = isMe ? Color(0xFF35B6AD) : Colors.grey[200];
    final textColor = isMe ? Colors.white : Colors.black;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe && initials != null)
          CircleAvatar(radius: 16, child: Text(initials)),
        if (!isMe) const SizedBox(width: 8),
        Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isMe && name != null)
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message, style: TextStyle(color: textColor)),
            ),
            if (blocker != null) _blockerCard(blocker),
            const SizedBox(height: 4),
            Text(
              dateTime,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _blockerCard(String name) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.all(10),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.warning, color: Colors.red, size: 20),
              SizedBox(width: 6),
              Text(
                "Blocker",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.warning_amber_outlined, size: 16),
              const SizedBox(width: 6),
              Expanded(
                // <-- gives the text the remaining width
                child: Text(
                  'Blocker assigné à: $name',
                  maxLines: 1, // keep it on one line
                  overflow:
                      TextOverflow.ellipsis, // fade to … if it’s still too long
                  softWrap: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _replyToMessage({required String replyText, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.reply, size: 16, color: Colors.teal),
            const SizedBox(width: 4),
            Text(
              replyText,
              style: const TextStyle(fontSize: 12, color: Colors.teal),
            ),
          ],
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }

  Widget _chatInputBar(Color accentColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.warning_amber_outlined, size: 18),
            label: const Text("Blocker"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tapez votre message...",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send, color: accentColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
