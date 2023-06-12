import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/constants.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/screens/auth/signin_or_signup_screen.dart';
import 'package:chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset("assets/images/welcome_image.png"),
            const Spacer(flex: 3),
            Text(
              "Welcome to our freedom \nmessaging app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Freedom talk any person of your \nmother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 3),
            FutureBuilder<AuthUser?>(
              future: context.read<UserProvider>().checkedLogedInUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // made a simple mistake here
                  // Let's restart the app
                  // Perfect
                  // But it's not shift the screen once user is loged out
                  if (snapshot.data != null) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MessagesScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const SkipButton();
                  }
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninOrSignupScreen(),
                ),
              ),
          child: Row(
            children: [
              Text(
                "Skip",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.8),
                    ),
              ),
              const SizedBox(width: defaultPadding / 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.8),
              )
            ],
          )),
    );
  }
}
