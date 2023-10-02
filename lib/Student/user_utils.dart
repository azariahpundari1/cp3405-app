import 'package:flutter_school_app/user_data.dart';

double getUserPoints(String userEmail) {
  final user = registeredUsers.firstWhere((user) => user.email == userEmail, orElse: () => User(name: '', email: '', inviteCode: '', password: '', points: 0));
  return user.points;
}
