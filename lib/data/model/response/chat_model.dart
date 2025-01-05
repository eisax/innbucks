class Chat {
  final String sender;
  final String message;
  final DateTime timestamp;
  final String? icon;
  final bool isOnline;

  Chat({
    required this.sender,
    required this.message,
    required this.timestamp,
    this.icon,
    this.isOnline = true
  });
}