import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'RadiosResponse.dart';

class RadioItem extends StatelessWidget {
  Radios radios;
  AudioPlayer audioPlayer;

  RadioItem({required this.radios, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            radios.name ?? '',
            style: provider.appTheme == ThemeMode.dark
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.whiteColor)
                : Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => audioPlayer.play(UrlSource(radios.url!)),
                icon: Icon(
                  Icons.play_arrow,
                  size: 40,
                ),
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLight,
              ),
              SizedBox(
                width: 40,
              ),
              IconButton(
                onPressed: audioPlayer.stop,
                icon: Icon(
                  Icons.stop,
                  size: 40,
                ),
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
