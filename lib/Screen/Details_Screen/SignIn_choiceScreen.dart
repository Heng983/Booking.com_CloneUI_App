import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Screen/LoginScreen.dart';
import 'package:hotel_app/widgets/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/button/Circle_Logo.dart';
import '../../widgets/button/OutlineButton.dart';

class SigninChoiceScreen extends StatelessWidget {
  const SigninChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        // keep Booking blue always
        backgroundColor: AppColors.blueColor,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, size: 26),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Booking.com",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              Text(
                "Sign in for easier access \nto your trip details",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                  color: cs.onBackground,
                ),
              ),
              const SizedBox(height: 42),
              Outlinedbutton(
                label: "Continue with Google",
                onPressed: () {},
                leading: CircleLogo(
                  child: SvgPicture.asset(
                    "assets/icons/google-svg-icon.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Outlinedbutton(
                label: "Continue with FaceBook",
                onPressed: () {},
                leading: CircleLogo(
                  child: SvgPicture.asset(
                    "assets/icons/facebook-svg-icon.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tabSelectedBlue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    "Continue with email",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: cs.onBackground.withOpacity(0.85),
                          ),
                          children: [
                            const TextSpan(
                              text:
                              "By signing in or creating an account, you agree\nwith our ",
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: const TextStyle(
                                color: AppColors.blueColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy\nStatement",
                              style: const TextStyle(
                                color: AppColors.blueColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "© 2006-2026 Booking.com",
                        style: TextStyle(
                          fontSize: 13,
                          color: cs.onBackground.withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
