import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_immi/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String username;
  final String email;
  String phoneNumber;
  String profile;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profile,
  });

  String get fullName => '$firstName $lastName';

  String get fullNameCapital {
    String capitalizedFirstName = firstName.isNotEmpty
        ? firstName[0].toUpperCase() + firstName.substring(1).toLowerCase()
        : '';
    String capitalizedLastName = lastName.isNotEmpty
        ? lastName[0].toUpperCase() + lastName.substring(1).toLowerCase()
        : '';
    return '$capitalizedFirstName $capitalizedLastName';
  }

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toUpperCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toUpperCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "hni_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profile: '');

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'],
  //     firstName: json['firstName'],
  //     lastName: json['lastName'],
  //     username: json['username'],
  //     email: json['email'],
  //     phoneNumber: json['phoneNumber'],
  //     profile: json['profile'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profile': profile,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profile: data['profile'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
