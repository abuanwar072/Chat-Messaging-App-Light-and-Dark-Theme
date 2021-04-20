import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

import '../../../components/recent_search_contacts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        children: [
          RecentSearchContacts(),
          SizedBox(height: defaultPadding),
          // you can show suggested style for search result
          SuggestedContacts()
        ],
      ),
    );
  }
}

class SuggestedContacts extends StatelessWidget {
  const SuggestedContacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            "Suggested",
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .color!
                      .withOpacity(0.32),
                ),
          ),
        ),
        SizedBox(height: defaultPadding),
        ...List.generate(
          demoContactsImage.length,
          (index) => ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(demoContactsImage[index]),
            ),
            title: Text("Jenny Wilson"),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

final List<String> demoContactsImage =
    List.generate(5, (index) => "assets/images/user_${index + 1}.png");
