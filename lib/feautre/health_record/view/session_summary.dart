import 'package:flutter/material.dart';
import 'package:smile_care/core/core.dart';

class SessionSummary extends StatelessWidget {
  const SessionSummary({super.key});

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
        children: [Image.asset("assets/images/summary.png"), SessionForm()],
      )),
    );
  }
}

class SessionForm extends StatefulWidget {
  @override
  _SessionFormState createState() => _SessionFormState();
}

class _SessionFormState extends State<SessionForm> {
  String? _selectedSession;

  Widget sessionInfo(String session) {
    Map<String, String> details = {
      'Session': 'Details for Session 1',
      'Session Number': '1',
      'Student Name': 'Baraa Aldarsani',
      'Student’s Comment': 'Finsh one session',
      'Doctor Name': 'Dr. Ahmad Burhan',
      "Doctor’s Comment": 'Good session',
      "Session Time": '27/3/2024 : 08:30',
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
                      icon:  Icon(
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
