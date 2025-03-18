import 'package:URBANPRO/models/admin/terms_model.dart';
import 'package:URBANPRO/services/admin/terms_service.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionsScreen extends StatefulWidget {
  @override
  _TermsConditionsScreenState createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  final TermsService _termsService = TermsService();
  final TextEditingController _termsController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _termsFocusNode = FocusNode();
  bool _isSaving = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTerms();

    /// **Auto-scroll when the last field is focused**
    _termsFocusNode.addListener(() {
      if (_termsFocusNode.hasFocus) {
        _scrollToBottom();
      }
    });
  }

  Future<void> _fetchTerms() async {
    TermsModel terms = await _termsService.fetchTerms();
    setState(() {
      _termsController.text = terms.terms;
      _isLoading = false;
    });
  }

  void _saveTerms() async {
    setState(() => _isSaving = true);

    TermsModel updatedTerms = TermsModel(
      terms: _termsController.text,
    );

    await _termsService.updateTerms(updatedTerms);

    setState(() => _isSaving = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Terms & Conditions Updated!")),
    );
  }

  /// **Scroll to bottom when field is focused**
  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _termsController.dispose();
    _scrollController.dispose();
    _termsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(
        backgroundColor: ThemeConstants.white,
        title: Text(
          "Terms & Conditions",
          style: AppTextStyle.Text18700,
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        controller: _scrollController,
                        padding: EdgeInsets.all(16),
                        children: [
                          /// **Student Terms**
                          CommonTextField(
                            controller: _termsController,
                            label: "Enter Terms & Conditions",
                            inputType: InputType.address,
                            onChanged: (value) {},
                            hint: 'Enter Terms & Conditions',
                            maxLines: 16,
                            focusNode: _termsFocusNode, // Attach focus node
                          ),

                          SizedBox(height: 16),
                        ],
                      ),
                    ),

                    /// **Save Button**
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: _isSaving
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: _saveTerms,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text("Save Terms",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
