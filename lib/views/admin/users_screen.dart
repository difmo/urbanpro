import 'package:URBANPRO/services/admin/user_service.dart';
import 'package:URBANPRO/views/widgets/admin/user_card.dart';
import 'package:flutter/material.dart';

import 'package:URBANPRO/models/admin/student.dart';
import 'package:URBANPRO/models/admin/teacher.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late UserService _userService;

  List<Student> _students = [];
  List<Teacher> _teachers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _userService = UserService();
    _tabController = TabController(length: 2, vsync: this);

    _fetchUsers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Student> students = await _userService.fetchStudents();
      List<Teacher> teachers = await _userService.fetchTeachers();

      setState(() {
        _students = students;
        _teachers = teachers;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Students'),
            Tab(text: 'Teachers'),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildStudentList(),
                _buildTeacherList(),
              ],
            ),
    );
  }

  Widget _buildStudentList() {
    return ListView.builder(
      itemCount: _students.length,
      itemBuilder: (context, index) {
        Student student = _students[index];
        return UserCard(
          name: student.name,
          email: student.email,
          phone: student.phone,
          role: "Student",
          extraInfo:
              "Grade: ${student.grade}\nSubjects: ${student.subjectsInterested}",
          onViewProfile: () => _viewProfile(student),
          onEdit: () => _editUser(student),
          onDelete: () => _deleteUser(student),
        );
      },
    );
  }

  void _viewProfile(Student student) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Viewing ${student.name}'s profile")));
  }

  void _editUser(Student student) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Editing ${student.name}")));
  }

  void _deleteUser(Student student) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${student.name} deleted")));
  }

  Widget _buildTeacherList() {
    return ListView.builder(
      itemCount: _teachers.length,
      itemBuilder: (context, index) {
        Teacher teacher = _teachers[index];
        return UserCard(
          name: teacher.name,
          email: teacher.email,
          phone: teacher.phone,
          role: "Teacher",
          extraInfo:
              "Specialization: ${teacher.specialization}\nExperience: ${teacher.experienceYears} years",
          onViewProfile: () => _viewTeacherProfile(teacher),
          onEdit: () => _editTeacher(teacher),
          onDelete: () => _deleteTeacher(teacher),
        );
      },
    );
  }

  /// 📌 View Profile Function
  void _viewTeacherProfile(Teacher teacher) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Viewing ${teacher.name}'s profile")),
    );
  }

  /// ✏️ Edit Teacher Function
  void _editTeacher(Teacher teacher) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Editing ${teacher.name}")),
    );
  }

  /// 🗑 Delete Teacher Function
  void _deleteTeacher(Teacher teacher) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${teacher.name} deleted")),
    );
  }
}
