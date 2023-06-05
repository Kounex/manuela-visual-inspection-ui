class YOLOImage {
  final String base64;
  final bool status;
  final String text;
  final DateTime timestamp;

  double? height;
  double? width;

  YOLOImage(
    this.base64,
    this.status,
    this.text,
    this.timestamp, {
    this.height,
    this.width,
  });

  factory YOLOImage.fromJSON(Map<String, dynamic> json) => YOLOImage(
        json['image'],
        json['status'] == 1,
        json['text'],
        json['timestamp'] ?? DateTime.now(),
      );
}
