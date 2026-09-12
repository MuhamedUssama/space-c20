import 'package:flutter/material.dart';
import 'package:space_app/core/utils/app_assets.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_text_styles.dart';

class MoonHeaderWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.halfMoon),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [Colors.transparent, AppColors.black],
                stops: const [0, .81],
                begin: .topCenter,
                end: .bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      'Explore',
                      style: AppTextStyles.bodyMeduim,
                      textAlign: .center,
                    ),
                    Text(
                      'Which planet\nwould you like to explore?',
                      style: AppTextStyles.bodyMeduim,
                      textAlign: .left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
