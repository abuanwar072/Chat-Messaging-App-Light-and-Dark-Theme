import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

import 'components/info.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            ProfilePic(image: "assets/images/user_2.png"),
            Text(
              "Annette Black",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(height: kDefaultPadding * 2),
            Info(
              infoKey: "User ID",
              info: "@annette.me",
            ),
            Info(
              infoKey: "Location",
              info: "New York, NYC",
            ),
            Info(
              infoKey: "Phone",
              info: "(239) 555-0108",
            ),
            Info(
              infoKey: "Email Address",
              info: "demo@mail.com",
            ),
            SizedBox(height: kDefaultPadding),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: PrimaryButton(
                  padding: EdgeInsets.all(5),
                  text: "Edit Profile",
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.image,
    this.isShowPhotoUpload = false,
    this.imageUploadBtnPress,
  }) : super(key: key);

  final String image;
  final bool isShowPhotoUpload;
  final VoidCallback? imageUploadBtnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color:
              Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.08),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(image),
          ),
          InkWell(
            onTap: imageUploadBtnPress,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
