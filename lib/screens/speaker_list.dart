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
          ? Center(child: CircularProgressIndicator()) // Show loading spinner
          : ListView.builder(
        itemCount: speakers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(speakers[index]['name'] ?? 'No Name'), // Adjust key based on API response
              subtitle: Text(speakers[index]['topic'] ?? 'No Topic'),
            ),
          );
        },
      ),
    );
  }
}
