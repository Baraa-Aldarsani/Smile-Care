// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';
import 'package:smile_care/feautre/feautre.dart';

class SessionSummary extends StatelessWidget {
  const SessionSummary(
      {super.key, required this.sessionInfo, required this.student});
  final SessionSummaryModel sessionInfo;
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        title: const Text("Session Summary"),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset("assets/images/summary.png"),
          SessionForm(sessionInfo: sessionInfo, student: student),
        ],
      )),
    );
  }
}

class SessionForm extends StatefulWidget {
  final SessionSummaryModel sessionInfo;
  final StudentModel student;
  const SessionForm(
      {super.key, required this.sessionInfo, required this.student});
  @override
  _SessionFormState createState() => _SessionFormState();
}

class _SessionFormState extends State<SessionForm> {
  String? _selectedSession;

  Widget sessionInfo(String session) {
    Map<String, String> details = {
      'Session': 'Details for Session 1',
      'Session Number': '1',
      'Student Name': "${widget.student.fName} ${widget.student.lName}",
      'Student’s Comment': widget.sessionInfo.detailsSessionModel.studentNotes,
      'Doctor Name':
          'Dr. ${widget.sessionInfo.supervisorModel!.firstName} ${widget.sessionInfo.supervisorModel!.lastName}',
      "Doctor’s Comment":
          widget.sessionInfo.detailsSessionModel.supervisorNotes,
      "Session Time": "${widget.sessionInfo.detailsSessionModel.history} || ${widget.sessionInfo.detailsSessionModel.time}",
    };
    return Text(details[session]!, style: const TextStyle(fontSize: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Palette.primaryLight,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 370,
      child: ListView(
        children: <Widget>[
          for (var session in [
            'Session',
            'Session Number',
            'Student Name',
            'Student’s Comment',
            'Doctor Name',
            'Doctor’s Comment',
            'Session Time'
          ])
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(session,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_selectedSession == session) {
                            _selectedSession = null;
                          } else {
                            _selectedSession = session;
                          }
                        });
                      },
                      icon: Icon(
                        _selectedSession == session ? Icons.remove : Icons.add,
                      ),
                    )
                  ],
                ),
                if (_selectedSession == session)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: sessionInfo(session),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
