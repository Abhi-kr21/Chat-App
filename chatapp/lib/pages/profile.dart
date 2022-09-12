import 'package:chatapp/models/UserModel.dart';
import 'package:chatapp/pages/CompleteProfile.dart';
import 'package:chatapp/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final UserModel user;
  Profile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Your Profile"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return EditaProfileBox(
                        user: user,
                      );
                    });
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.profilepic!),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Username :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Flexible(
                    child: Text(
                      user.fullname!,
                      maxLines: 2,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Email id :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  Text(
                    user.email!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
