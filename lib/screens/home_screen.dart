import 'package:flutter/material.dart';
import 'package:space_app/core/models/planet_model.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_text_styles.dart';
import 'package:space_app/core/widgets/custom_explore_button.dart';
import 'package:space_app/core/widgets/moon_header_widget.dart';
import 'package:space_app/screens/planet_deatils_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const MoonHeaderWidget(
            title: 'Explore',
            subTitle: 'Which planet\nwould you like to explore?',
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/images/${Planet.planets[index].pngImage}',
                );
              },
              itemCount: Planet.planets.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                  ),
                  icon: const Icon(Icons.arrow_back),
                ),

                Text(
                  Planet.planets[currentPage].name,
                  style: AppTextStyles.bodyMeduim,
                ),

                IconButton(
                  onPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                  ),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),

          const SizedBox(height: 36),
          CustomExploreButton(
            text: 'Explore ${Planet.planets[currentPage].name}',
            onPressed: () {
              Navigator.pushNamed(
                context,
                PlanetDeatilsScreen.routeName,
                arguments: Planet.planets[currentPage],
              );
            },
          ),
        ],
      ),
    );
  }
}
