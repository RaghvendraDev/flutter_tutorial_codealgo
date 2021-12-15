import 'dart:convert';

class UserDataModel {
  final String rUserName;
  final String rUserEmail;
  final String rUserMobile;
  final String rUserGender;
  final String rUserProfileImg;
  final String rMsg;
  UserDataModel({
    required this.rUserName,
    required this.rUserEmail,
    required this.rUserMobile,
    required this.rUserGender,
    required this.rUserProfileImg,
    required this.rMsg,
  });

  UserDataModel copyWith({
    String? rUserName,
    String? rUserEmail,
    String? rUserMobile,
    String? rUserGender,
    String? rUserProfileImg,
    String? rMsg,
  }) {
    return UserDataModel(
      rUserName: rUserName ?? this.rUserName,
      rUserEmail: rUserEmail ?? this.rUserEmail,
      rUserMobile: rUserMobile ?? this.rUserMobile,
      rUserGender: rUserGender ?? this.rUserGender,
      rUserProfileImg: rUserProfileImg ?? this.rUserProfileImg,
      rMsg: rMsg ?? this.rMsg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rUserName': rUserName,
      'rUserEmail': rUserEmail,
      'rUserMobile': rUserMobile,
      'rUserGender': rUserGender,
      'rUserProfileImg': rUserProfileImg,
      'rMsg': rMsg,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      rUserName: map['rUserName'] ?? '',
      rUserEmail: map['rUserEmail'] ?? '',
      rUserMobile: map['rUserMobile'] ?? '',
      rUserGender: map['rUserGender'] ?? '',
      rUserProfileImg: map['rUserProfileImg'] ?? '',
      rMsg: map['rMsg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDataModel(rUserName: $rUserName, rUserEmail: $rUserEmail, rUserMobile: $rUserMobile, rUserGender: $rUserGender, rUserProfileImg: $rUserProfileImg, rMsg: $rMsg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDataModel &&
        other.rUserName == rUserName &&
        other.rUserEmail == rUserEmail &&
        other.rUserMobile == rUserMobile &&
        other.rUserGender == rUserGender &&
        other.rUserProfileImg == rUserProfileImg &&
        other.rMsg == rMsg;
  }

  @override
  int get hashCode {
    return rUserName.hashCode ^
        rUserEmail.hashCode ^
        rUserMobile.hashCode ^
        rUserGender.hashCode ^
        rUserProfileImg.hashCode ^
        rMsg.hashCode;
  }
}
