import 'package:URBANPRO/controllers/profile_controller.dart';
import 'package:URBANPRO/models/profile_send_modal.dart';
import 'package:URBANPRO/utils/storage_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/back_app_bar.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({super.key});

  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final _formKey = GlobalKey<FormState>();
  final StorageService _storageServices = StorageService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _boardNameController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

    final profileController = Get.put(ProfileController());
final storageService = StorageService();
 @override
 @override
void initState() {
  super.initState();
  _initializeData();
}

void _initializeData() async {
  final data = await storageService.read('login_details'); // or any key you stored
   final data1 =  profileController.getProfileController();
   
   print(data1);
  if (data != null) {
    print("✅ Data found for key:");
    print("Token: ${data['token']}");
    print("User ID: ${data['userId']}");
    print("User Name: ${data['userName']}");
  } else {
    print("⚠️ No data found for the given key.");
  }
}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: BackAppBar(title: "Profile Edit"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonTextField(
                  inputType: InputType.name,
                  controller: _nameController,
                  onChanged: (value) {},
                  label: 'Name',
                  hint: 'Enter your name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  inputType: InputType.email,
                  controller: _emailController,
                  onChanged: (value) {},
                  label: 'Email',
                  hint: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  inputType: InputType.phone,
                  controller: _phoneController,
                  onChanged: (value) {},
                  label: 'Phone',
                  hint: 'Enter your phone number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CommonTextField(
                  inputType: InputType.name,
                  controller: _boardNameController,
                  onChanged: (value) {},
                  label: 'Board Name',
                  hint: 'Enter your Board Name',
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your phone number';
                  //   }
                  //   if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  //     return 'Please enter a valid 10-digit phone number';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 24),
                CommonTextField(
                  inputType: InputType.name,
                  controller: _courseNameController,
                  onChanged: (value) {},
                  label: 'Course Name',
                  hint: 'Enter your Course Name',
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your phone number';
                  //   }
                  //   if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  //     return 'Please enter a valid 10-digit phone number';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 24),
                CommonTextField(
                  inputType: InputType.name,
                  controller: _priceController,
                  onChanged: (value) {},
                  label: 'Price',
                  hint: 'Enter your Price',
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your phone number';
                  //   }
                  //   if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  //     return 'Please enter a valid 10-digit phone number';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 24),
                CustomButton(
                  width: 200,
                  text: "Update Profile",
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                      submitForm();
                      // _initializeData();
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //       content: Text('Profile updated successfully')),
                      // ); 
                    // }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    final profileController = Get.put(ProfileController());
    final userdata = await _storageServices.readUserData();
    final id = userdata?.userData?.id ?? 'defaultId';

    final studentProfile = StudentProfileSetUpdateModal(
      boardName: _boardNameController.text,
      courseId: "1",
      subjectId: "1",
      price: _priceController.text,
      latitude: "latitudePlaceholder",
      longitude: "longitudePlaceholder",
      location: "locationPlaceholder",
      userId: "1",
      mobile: _phoneController.text,
    );

    try {
      await profileController.setProfileController(studentProfile);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _boardNameController.dispose();
    _courseNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
