import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/models.dart';

class UserProfileView extends ConsumerWidget {
  static route(UserModel userModel) => MaterialPageRoute(
        builder: (context) => UserProfileView(
          userModel: userModel,
        ),
      );
  final UserModel userModel;
  const UserProfileView({super.key, required this.userModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: UserProfileView(userModel: userModel),
    );
  }
}