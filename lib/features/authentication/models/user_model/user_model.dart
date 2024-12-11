import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  String firstName;
  String lastName;
  final String userName;
  final String email;
  final String id;
  String phoneNumber;
  String picture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.picture});

  String get fullName => '$firstName $lastName';
  String get formatPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generatusername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = (nameParts.length > 1) ? nameParts[1].toLowerCase() : '';

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPerfix = 'cwt_$camelCaseUserName';
    return userNameWithPerfix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      picture: '');

  Map<String, dynamic> toJson() => {
        'FirstName': firstName,
        'LastName': lastName,
        'UserName': userName,
        'Email': email,
        'PhoneNumber': phoneNumber,
        'Picture': picture
      };

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return UserModel(
          id: documentSnapshot.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          picture: data['Picture'] ?? "");
    } else {
      return UserModel.empty();
    }
  }
}
