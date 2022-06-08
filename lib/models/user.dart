import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String password;
  final String year;
  final String branch;

  const User({
    required this.email,
    required this.password,
    required this.year,
    required this.branch,
  });

  // static User fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return User(
  //     email: snapshot["email"],
  //     password: snapshot["password"],
  //     year: snapshot["year"],
  //     branch: snapshot["branch"],
  //   );
  // }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "year": year,
        "branch": branch,
      };
}
