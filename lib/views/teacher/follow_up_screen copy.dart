import 'package:flutter/material.dart';

class FollowUp {
  final String name;
  final String classInfo;
  final String location;
  final String type;
  final String status;
  final String date;
  final String avatar;

  FollowUp({
    required this.name,
    required this.classInfo,
    required this.location,
    required this.type,
    required this.status,
    required this.date,
    required this.avatar,
  });
}

class FollowUpScreen extends StatefulWidget {
  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<FollowUp> _followUpsList = [];
  List<FollowUp> _filteredFollowUps = [];
  int _page = 0;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadMoreFollowUps();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        _loadMoreFollowUps();
      }
    });
  }

  Future<void> _loadMoreFollowUps() async {
    setState(() => _isLoadingMore = true);

    List<FollowUp> newFollowUps = List.generate(
      10,
      (index) => FollowUp(
        name: "Student ${_page * 10 + index + 1}",
        classInfo: "Class 11 Tuition",
        location: "Delhi",
        type: "Online Class 💻",
        status: "Enquiry",
        date: "02 Jan",
        avatar: "S",
      ),
    );

    setState(() {
      _page++;
      _isLoadingMore = false;
      _followUpsList.addAll(newFollowUps);
      _filteredFollowUps = _followUpsList;
    });
  }

  void _filterFollowUps(String query) {
    setState(() {
      _filteredFollowUps = _followUpsList.where((followUp) {
        return followUp.name.toLowerCase().contains(query.toLowerCase()) ||
            followUp.classInfo.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> _refreshFollowUps() async {
    setState(() {
      _page = 0;
      _followUpsList.clear();
      _loadMoreFollowUps();
    });
  }

  Widget _buildFollowUpItem(FollowUp followUp) {
    return ListTile(
      leading: CircleAvatar(child: Text(followUp.avatar)),
      title: Text(followUp.name),
      subtitle: Text("${followUp.classInfo} - ${followUp.status}"),
      trailing: Text(followUp.date),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Follow Ups')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterFollowUps,
              decoration: InputDecoration(
                hintText: 'Search follow-ups...',
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshFollowUps,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _filteredFollowUps.length + 1,
                itemBuilder: (context, index) {
                  if (index == _filteredFollowUps.length) {
                    return _isLoadingMore
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox.shrink();
                  }

                  final followUp = _filteredFollowUps[index];
                  return Dismissible(
                    key: Key(followUp.name),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() => _filteredFollowUps.removeAt(index));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${followUp.name} marked as completed!')),
                      );
                    },
                    child: _buildFollowUpItem(followUp),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
