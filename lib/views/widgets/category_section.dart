import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ExploreCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": FeatherIcons.penTool, "label": "Design"},
    {"icon": FeatherIcons.code, "label": "Programmer"},
    {"icon": FeatherIcons.dollarSign, "label": "Finance"},
    {"icon": FeatherIcons.settings, "label": "Soft skill"},
    {"icon": FeatherIcons.monitor, "label": "Accountancy"},
    {"icon": FeatherIcons.share2, "label": "Data science"},
    {"icon": FeatherIcons.globe, "label": "Language"},
    {"icon": FeatherIcons.barChart2, "label": "Marketing"},
  ];

  ExploreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: ThemeConstants.primaryColorSoft,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(categories[index]['icon'],
                          size: 35,
                          color: const Color.fromARGB(255, 198, 198, 198)),
                          // color: const Color.fromARGB(255, 46, 185, 255)),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Text(
                  categories[index]['label'],
                  style: AppTextStyle.Text12400,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
