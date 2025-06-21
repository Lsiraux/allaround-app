class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': Uri.encodeComponent(password),
  };
}

class LoginResponse {
  final String? token;
  final String? result;
  final String? message;
  final Map<String, dynamic>? data;

  LoginResponse({this.token, this.result, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      result: json['result'],
      message: json['message'],
      data: json['data'] is Map<String, dynamic> ? json['data'] : {},
    );
  }
}
