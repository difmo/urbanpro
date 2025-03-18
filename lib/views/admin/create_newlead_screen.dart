import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/admin/dynamic_dropdown.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateNewLeadScreen extends StatefulWidget {
  @override
  _CreateNewLeadScreenState createState() => _CreateNewLeadScreenState();
}

class _CreateNewLeadScreenState extends State<CreateNewLeadScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _feeController = TextEditingController();
  final TextEditingController _requiredCoinsController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();

  String? selectedBoard = "ISC Board";
  String? selectedGender = "Female";
  String? selectedState = "Uttar Pradesh";
  String? selectedCity = "Lucknow";
  String? selectedTeachingMode = "Online";
  List<String> allClasses = ["All Classes", "Nursery", "KG", "LKG", "UKG"];
  List<String> selectedClasses = [];
  List<String> selectedSubjects = [];
  List<String> allSubjects = [
    "All Subjects",
    "English",
    "Math",
    "Science",
    "Hindi",
    "SST"
  ];

  void _saveLead() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lead Saved Successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Post")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextField(
                inputType: InputType.address,
                controller: _descriptionController,
                onChanged: (value) {},
                label: "Description",
                hint: "Enter Description",
                maxLines: 5,
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextField(
                inputType: InputType.phone,
                controller: _feeController,
                onChanged: (value) {},
                label: "Fee",
                hint: "Enter Fee",
                maxLines: 1,
              ),
              SizedBox(
                height: 16,
              ),
              CustomDropdownWidget<String>(
                items: ["ISC Board", "CBSE", "State Board"],
                initialValue: selectedBoard,
                hintText: "Select Board",
                onSelectedValueChanged: (value) {
                  print("Selected Value: $value");
                  setState(() => selectedBoard = value);
                },
              ),
              _buildSectionTitle("Class Preferences"),
              _buildClassSelector(),
              _buildSectionTitle("Subject Preferences"),
              SizedBox(
                height: 8,
              ),
              _buildSubjectSelector(),
              CustomDropdownWidget<String>(
                items: ["Online", "Offline"],
                initialValue: selectedTeachingMode,
                hintText: "Teaching Mode",
                onSelectedValueChanged: (value) {
                  print("Selected Value: $value");
                  setState(() => selectedTeachingMode = value);
                },
              ),
              _buildSectionTitle("Location Preferences"),
              CustomDropdownWidget<String>(
                items: ["Uttar Pradesh", "Delhi", "Maharashtra"],
                initialValue: selectedState,
                hintText: "State",
                onSelectedValueChanged: (value) {
                  print("Selected Value: $value");
                  setState(() => selectedState = value);
                },
              ),
              _buildSectionTitle("Other Preferences"),
              CustomDropdownWidget<String>(
                items: ["Male", "Female", "Any"],
                initialValue: selectedGender,
                hintText: "Gender Preference",
                onSelectedValueChanged: (value) {
                  print("Selected Value: $value");
                  setState(() => selectedGender = value);
                },
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextField(
                inputType: InputType.phone,
                controller: _requiredCoinsController,
                onChanged: (value) {},
                label: "Required Coins",
                hint: "Required Coins",
                maxLines: 1,
              ),
              _buildSectionTitle("Contact Details"),
              SizedBox(
                height: 8,
              ),
              CommonTextField(
                inputType: InputType.name,
                controller: _nameController,
                onChanged: (value) {},
                label: "Name",
                hint: "Enter Name",
                maxLines: 1,
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextField(
                inputType: InputType.phone,
                controller: _contactNumberController,
                onChanged: (value) {},
                label: "Contact Number",
                hint: "Enter Number",
                maxLines: 1,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    baseTextColor: ThemeConstants.whiteColor,
                    text: 'Save Lead',
                    onPressed: _saveLead),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 5),
      child: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildChips(List<String> items) {
    return Wrap(
      spacing: 8,
      children: items.map((e) {
        return Chip(
          label: Text(e),
          deleteIcon: Icon(Icons.close),
          onDeleted: () {
            setState(() => items.remove(e));
          },
        );
      }).toList(),
    );
  }

  Widget _buildClassSelector() {
    return GestureDetector(
      onTap: _selectClasses,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ThemeConstants.grey, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedSubjects.isNotEmpty
                    ? selectedSubjects.join(", ")
                    : "Select Classes",
                style: TextStyle(
                  fontSize: 14,
                  color: selectedSubjects.isNotEmpty
                      ? Colors.black87
                      : Colors.grey,
                  fontWeight: selectedSubjects.isNotEmpty
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }

  void _selectClasses() async {
    List<String> tempSelected = List.from(selectedClasses);

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: const Text(
                "Select Classes",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: allClasses.map((subject) {
                    return CheckboxListTile(
                      activeColor: ThemeConstants.primaryColor,
                      value: tempSelected.contains(subject),
                      title: Text(
                        subject,
                        style: TextStyle(
                          fontSize: 16,
                          color: tempSelected.contains(subject)
                              ? ThemeConstants.primaryColor
                              : Colors.black87,
                          fontWeight: tempSelected.contains(subject)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      onChanged: (bool? selected) {
                        setDialogState(() {
                          if (selected == true) {
                            tempSelected.add(subject);
                          } else {
                            tempSelected.remove(subject);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.redAccent)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => selectedSubjects = tempSelected);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: ThemeConstants.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSubjectSelector() {
    return GestureDetector(
      onTap: _selectSubjects,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ThemeConstants.grey, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedSubjects.isNotEmpty
                    ? selectedSubjects.join(", ")
                    : "Select Subjects",
                style: TextStyle(
                  fontSize: 14,
                  color: selectedSubjects.isNotEmpty
                      ? Colors.black87
                      : Colors.grey,
                  fontWeight: selectedSubjects.isNotEmpty
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }

  void _selectSubjects() async {
    List<String> tempSelected = List.from(selectedSubjects);

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: const Text(
                "Select Subjects",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: allSubjects.map((subject) {
                    return CheckboxListTile(
                      activeColor: ThemeConstants.primaryColor,
                      value: tempSelected.contains(subject),
                      title: Text(
                        subject,
                        style: TextStyle(
                          fontSize: 16,
                          color: tempSelected.contains(subject)
                              ? ThemeConstants.primaryColor
                              : Colors.black87,
                          fontWeight: tempSelected.contains(subject)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      onChanged: (bool? selected) {
                        setDialogState(() {
                          if (selected == true) {
                            tempSelected.add(subject);
                          } else {
                            tempSelected.remove(subject);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.redAccent)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => selectedSubjects = tempSelected);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: ThemeConstants.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
