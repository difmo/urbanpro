import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/colors.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Column(
        children: [
          // Live Classes List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                _buildClassCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1544717305-2782549b5136?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  title: "Kannada Language classes - by Deepashree",
                  reviews: "61 reviews",
                  dateTime: "Mon, 10 Feb at 02:00pm IST",
                  classTime: "00 Days 00 Hour 00 Min 02 Sec",
                ),
                _buildClassCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1544717305-2782549b5136?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  title: "Class 7 Tuition - by Jaikumar Veerwani",
                  reviews: "12 reviews",
                  dateTime: "Mon, 10 Feb at 02:10pm IST",
                  classTime: "00 Days 00 Hour 09 Min 58 Sec",
                ),
                _buildClassCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1544717305-2782549b5136?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  title:
                      "BTech Tuition - BTech Electrical & Communication Engineering",
                  reviews: "11 reviews",
                  dateTime: "Mon, 10 Feb at 03:00pm IST",
                  classTime: "00 Days 00 Hour 59 Min 58 Sec",
                ),
                _buildClassCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1544717305-2782549b5136?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  title:
                      "BTech Tuition - BTech Electrical & Communication Engineering",
                  reviews: "11 reviews",
                  dateTime: "Mon, 10 Feb at 03:00pm IST",
                  classTime: "00 Days 00 Hour 59 Min 58 Sec",
                ),
                _buildClassCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1544717305-2782549b5136?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  title:
                      "BTech Tuition - BTech Electrical & Communication Engineering",
                  reviews: "11 reviews",
                  dateTime: "Mon, 10 Feb at 03:00pm IST",
                  classTime: "00 Days 00 Hour 59 Min 58 Sec",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard({
    required String imageUrl,
    required String title,
    required String reviews,
    required String dateTime,
    required String classTime,
  }) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 0.5),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Class Image with "Live" Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        height: 90,
                        width: 90,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 90,
                        width: 90,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
                // Live Badge
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),

            // Class Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Class Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 5),

                  // Reviews & Stars
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const Icon(Icons.star_half,
                          color: Colors.orange, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        "($reviews)",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Date & Time
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(dateTime,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Class Timer
                  Text(
                    "Starts in: $classTime",
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade700),
                  ),

                  const SizedBox(height: 5),

                  // Register Button & Free Trial Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          fontSize: 12,
                          baseTextColor: ThemeConstants.primaryColor,
                          borderColor: ThemeConstants.primaryColor,
                          backgroundColor: AppColors.white,
                          width: 80,
                          height: 30,
                          text: "Register",
                          onPressed: () {}),
                      const Text(
                        "FREE Trial",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSize _appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(130),
    child: Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: _boxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            _topBar(),
            const SizedBox(height: 5),
            CommonTextField(
                height: 7,
                borderColor: Colors.grey[300],
                inputType: InputType.name,
                controller: TextEditingController(),
                onChanged: (p0) => {},
                label: "",
                icon: Icons.search_rounded,
                hint: "Search teacher")
            // _searchBox(),
          ],
        ),
      ),
    ),
  );
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    border: Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    gradient: LinearGradient(
      colors: [Colors.white, AppColors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

Widget _topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(
            'Urban ',
            textAlign: TextAlign.center,
            style: AppTextStyle.Text18600,
          ),
          Text(
            'Pro',
            textAlign: TextAlign.center,
            style: AppTextStyle.Text18600.copyWith(
                color: ThemeConstants.secondaryColor),
          ),
        ],
      ),
     
    IconButton(
      icon: const Icon(Icons.notifications, color: Colors.grey),
      onPressed: () {
        // Handle bell icon press
      },
    )
    ],
  );
}


