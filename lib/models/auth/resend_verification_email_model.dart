class ResendVerificationEmailRequestBody {
  final String email;

  ResendVerificationEmailRequestBody({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

class ResendVerificationEmailResponseBody {
  final String result;
  final String message;
  final Map<String, dynamic> data;

  ResendVerificationEmailResponseBody({
    required this.result,
    required this.message,
    required this.data,
  });

  factory ResendVerificationEmailResponseBody.fromJson(
    Map<String, dynamic> json,
  ) {
    return ResendVerificationEmailResponseBody(
      result: json['result'],
      message: json['message'],
      data: json['data'] is Map<String, dynamic> ? json['data'] : {},
    );
  }
}
