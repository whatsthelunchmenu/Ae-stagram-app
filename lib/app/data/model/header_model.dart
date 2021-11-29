class Header {
  final bool result;
  final String message;
  final int status;

  const Header({
    this.result = false,
    this.message = "",
    this.status = 400,
  });

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      result: json['result'],
      message: json['message'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
      };
}
