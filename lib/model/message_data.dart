import 'package:meta/meta.dart';//if you only need the immutable class

@immutable
class MessageData{
  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dateMessage;
  final String profilePicture;

  MessageData({
    required this.senderName,
    required this.message,
    required this.messageDate,
    required this.dateMessage,
    required this.profilePicture});
}