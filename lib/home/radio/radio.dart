import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamii/home/radio/RadiosResponse.dart';
import 'package:islamii/home/radio/radio_item.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return FutureBuilder(
      future: getRadios(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var radios = snapshot.data?.radios ?? [];
          return Column(
            children: [
              Expanded(
                  flex: 2, child: Image.asset('assets/images/radio_image.png')),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: radios.length,
                  itemBuilder: (context, index) => RadioItem(
                    radios: radios[index],
                    audioPlayer: audioPlayer,
                  ),
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong.'));
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.yellowColor
                  : MyTheme.primaryLight,
            ),
          );
        }
      },
    );
  }

  Future<RadiosResponse> getRadios() async {
    var uri = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadiosResponse.fromJson(json);
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
