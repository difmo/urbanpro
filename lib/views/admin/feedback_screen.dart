import 'package:URBANPRO/models/admin/feedback_model.dart';
import 'package:URBANPRO/services/admin/feedback_service.dart';
import 'package:URBANPRO/views/widgets/admin/feedback_card.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final FeedbackService _feedbackService = FeedbackService();
  List<FeedbackModel> _feedbacks = [];
  bool _isLoading = false;
  String _selectedUserType = "All";
  String _selectedSort = "Recent";

  @override
  void initState() {
    super.initState();
    _fetchFeedbacks();
  }

  Future<void> _fetchFeedbacks() async {
    setState(() => _isLoading = true);
    List<FeedbackModel> feedbacks = await _feedbackService.fetchFeedbacks();
    setState(() {
      _feedbacks = feedbacks;
      _isLoading = false;
    });
  }

  /// **Filter Feedbacks by User Type**
  List<FeedbackModel> _getFilteredFeedbacks() {
    List<FeedbackModel> filteredList = _selectedUserType == "All"
        ? _feedbacks
        : _feedbacks
            .where((feedback) => feedback.userType == _selectedUserType)
            .toList();

    /// **Sort Feedbacks**
    if (_selectedSort == "Highest Rated") {
      filteredList.sort((a, b) => b.rating.compareTo(a.rating));
    } else {
      filteredList.sort((a, b) => b.date.compareTo(a.date));
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedbacks")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// **Filters: User Type & Sorting**
            Row(
              children: [
                Expanded(
                    child: _buildDropdown(
                        ["All", "Students", "Teachers"], _selectedUserType,
                        (value) {
                  setState(() => _selectedUserType = value);
                })),
                SizedBox(width: 8),
                Expanded(
                    child: _buildDropdown(
                        ["Recent", "Highest Rated"], _selectedSort, (value) {
                  setState(() => _selectedSort = value);
                })),
              ],
            ),

            SizedBox(height: 12),

            /// **Feedback List**
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _getFilteredFeedbacks().isEmpty
                      ? Center(child: Text("No feedbacks found"))
                      : ListView.builder(
                          itemCount: _getFilteredFeedbacks().length,
                          itemBuilder: (context, index) {
                            return FeedbackCard(
                                feedback: _getFilteredFeedbacks()[index]);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Reusable Dropdown Widget**
  Widget _buildDropdown(
      List<String> options, String selectedValue, Function(String) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) => onChanged(value!),
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}
