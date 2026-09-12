import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_app/core/models/planet_model.dart';
import 'package:space_app/core/utils/app_colors.dart';
import 'package:space_app/core/utils/app_text_styles.dart';
import 'package:space_app/core/widgets/moon_header_widget.dart';

class PlanetDeatilsScreen extends StatefulWidget {
  static const String routeName = '/details-screen';
  const new({super.key});

  @override
  State<PlanetDeatilsScreen> createState() => _PlanetDeatilsScreenState();
}

class _PlanetDeatilsScreenState extends State<PlanetDeatilsScreen> {
  late final Planet planet;

  @override
  void didChangeDependencies() {
    planet = ModalRoute.of(context)?.settings.arguments as Planet;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          MoonHeaderWidget(
            title: planet.name,
            subTitle: planet.title,
            isDetailsScreen: true,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: ModelViewer(
              backgroundColor: AppColors.black,
              src: 'assets/models/${planet.model3D}',
              alt: planet.title,
              ar: false,
              autoRotate: true,
              iosSrc: planet.model3D,
              disableZoom: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              crossAxisAlignment: .start,
              children: [
                Text('About', style: AppTextStyles.bodyMeduim),
                Text(planet.about, style: AppTextStyles.bodySmall),
                const SizedBox(height: 8),
                Text(
                  "Distance from Sun (km) : ${planet.distanceFromSun}",
                  style: AppTextStyles.bodySmall,
                ),
                Text(planet.lengthOfDay, style: AppTextStyles.bodySmall),
                Text(
                  planet.orbitalPeriod.toString(),
                  style: AppTextStyles.bodySmall,
                ),
                Text(planet.radius, style: AppTextStyles.bodySmall),
                Text(planet.mass, style: AppTextStyles.bodySmall),
                Text(planet.gravity.toString(), style: AppTextStyles.bodySmall),
                Text(planet.surfaceArea, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
