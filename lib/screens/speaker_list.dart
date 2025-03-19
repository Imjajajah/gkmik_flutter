import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SpeakersList extends StatefulWidget {
  @override
  _SpeakersListState createState() => _SpeakersListState();
}

class _SpeakersListState extends State<SpeakersList> {
  List<dynamic> speakers = [];

  @override
  void initState() {
    super.initState();
    fetchSpeakers();
  }

  Future<void> fetchSpeakers() async {
    final response = await http.get(Uri.parse("https://api.event.gfmic.ph/Event_Management/api/SpeakersDetails/"));

    if (response.statusCode == 200) {
      setState(() {
        speakers = json.decode(response.body);
      });
    } else {
      print("Failed to load speakers");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speakers List")),
      body: speakers.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
        itemCount: speakers.length,
        itemBuilder: (context, index) {
          var speaker = speakers[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(speaker['speaker_name'] ?? 'No Name'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ${speaker['email_address'] ?? 'No Email'}"),
                  Text("Contact: ${speaker['contact_number'] ?? 'No Contact'}"),
                  Text("Occupation: ${speaker['occupation'] ?? 'No Occupation'}"),
                  Text("Company: ${speaker['company'] ?? 'No Company'}"),
                  Text("Education: ${speaker['education'] ?? 'No Education'}"),
                  Text("Active: ${speaker['active_flag'] ? 'Yes' : 'No'}"),
                  Text("Archived: ${speaker['is_archived'] ? 'Yes' : 'No'}"),
                ],
              ),
              leading: speaker['photo'] != null
                ? CircleAvatar(
                    backgroundImage:  NetworkImage("https://api.event.gfmic.ph${speaker['photo']}"),
              )
                : CircleAvatar(
                    child: Icon(Icons.person),
              ),
            ),
          );
        },
      ),
    );
  }
}
