import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/search/components/body.dart';
import 'package:flutter/material.dart';

import 'components/profile_pic.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            ProfilePic(
              image: demoContactsImage[0],
              imageUploadBtnPress: () {},
            ),
            Divider(),
            Form(
              child: Column(
                children: [
                  UserEditField(
                    text: "Name",
                    child: TextFormField(
                      initialValue: "Annette Black",
                    ),
                  ),
                  UserEditField(
                    text: "Email",
                    child: TextFormField(
                      initialValue: "annette@gmail.com",
                    ),
                  ),
                  UserEditField(
                    text: "Phone",
                    child: TextFormField(
                      initialValue: "(316) 555-0116",
                    ),
                  ),
                  UserEditField(
                    text: "Address",
                    child: TextFormField(
                      initialValue: "New York, NVC",
                    ),
                  ),
                  UserEditField(
                    text: "Old Password",
                    child: TextFormField(
                      obscureText: true,
                      initialValue: "demopass",
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  UserEditField(
                    text: "New Password",
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "New Password"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  child: PrimaryButton(
                    padding: EdgeInsets.all(5),
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.08),
                    text: "Cancel",
                    press: () {},
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    padding: EdgeInsets.all(5),
                    text: "Save Update",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserEditField extends StatelessWidget {
  const UserEditField({
    Key? key,
    required this.text,
    required this.child,
  }) : super(key: key);

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(text),
          ),
          Expanded(
            flex: 3,
            child: child,
          ),
        ],
      ),
    );
  }
}
