class VerifyRequestBody {
  final String token;

  VerifyRequestBody({required this.token});

  Map<String, dynamic> toJson() => {'token': token};
}

class VerifyResponseBody {
  final String result;
  final String message;
  final Map<String, dynamic> data;

  VerifyResponseBody({
    required this.result,
    required this.message,
    required this.data,
  });

  factory VerifyResponseBody.fromJson(Map<String, dynamic> json) {
    return VerifyResponseBody(
      result: json['result'],
      message: json['message'],
      data: json['data'] is Map<String, dynamic> ? json['data'] : {},
    );
  }
}
