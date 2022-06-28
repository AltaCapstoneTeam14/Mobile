import 'package:json_annotation/json_annotation.dart';
part 'RegisterResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponse {
  late String timestamp;
  late String code;
  late String message;

  RegisterResponse({
    required this.timestamp,
    required this.code,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$RegisterResponseFromJson(jsonData);

  static Map<String, dynamic> toJson(RegisterResponse registerResponse) =>
      _$RegisterResponseToJson(registerResponse);
}
