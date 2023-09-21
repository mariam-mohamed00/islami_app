import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/home/hadeth/item_hadeth_name.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadithList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadithList.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_image.png')),
        Divider(
          color: provider.appTheme == ThemeMode.dark
              ? MyTheme.yellowColor
              : Theme
              .of(context)
              .primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: provider.appTheme == ThemeMode.dark
              ? Theme
              .of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: MyTheme.whiteColor)
              : Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
        Divider(
          color: provider.appTheme == ThemeMode.dark
              ? MyTheme.yellowColor
              : Theme
              .of(context)
              .primaryColor,
          thickness: 3,
        ),
        ahadithList.isEmpty
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.yellowColor
                  : Theme
                  .of(context)
                  .primaryColor,
            ),
          ),
        )
            : Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.yellowColor
                    : Theme
                    .of(context)
                    .primaryColor,
                thickness: 3,
              );
            },
            itemBuilder: (context, index) {
              return ItemHadethName(
                hadeth: ahadithList[index],
              );
            },
            itemCount: ahadithList.length,
          ),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String ahadethContent =
    await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadithList.add(hadeth);
      setState(() {});
    }
  }
}

/// data class
class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
