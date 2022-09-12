import 'package:chatapp/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class EditaProfileBox extends StatefulWidget {
  UserModel user;

  EditaProfileBox({required this.user});

  @override
  State<EditaProfileBox> createState() => _EditaProfileBoxState();
}

class _EditaProfileBoxState extends State<EditaProfileBox> {
  TextEditingController? name;
  TextEditingController? email;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.user.fullname);
    email = TextEditingController(text: widget.user.email);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: "UserName"),
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.user.uid)
                  .update({"email": email!.text, "fullname": name!.text}).then(
                      (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Changes have been made but it may take time to reflect")));
              });
            },
            child: Text('Save'))
      ],
    );
  }
}
