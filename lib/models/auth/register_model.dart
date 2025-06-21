class RegisterRequestBody {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': Uri.encodeComponent(password),
    'firstName': firstName,
    'lastName': lastName,
  };
}

class RegisterResponse {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? result;
  final String? message;
  final Map<String, dynamic>? data;

  RegisterResponse({
    this.email,
    this.firstName,
    this.lastName,
    this.result,
    this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      result: json['result'],
      message: json['message'],
      data: json['data'] is Map<String, dynamic> ? json['data'] : {},
    );
  }
}
