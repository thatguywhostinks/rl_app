import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rl_app/services/get_active_teams.dart';
import 'package:rl_app/widgets/loading_widget.dart';

// List accountNullImage(teamListMap) {
//   for (var i = 0; i >= teamListMap.length; i++){
//     if (teamListMap[i]['team'].containsKey('image') == false) {
//       teamListMap[i]['team']['image'] = 'https://griffon.octane.gg/teams/BS+COMPETITION.png';
//     }
//   }
//   return teamListMap;
// }

// Idea for layout is:
// ListView with Team Photo -> Team Name -> 3 main players (w/Nationality flag)

class FavTeamSelect extends StatefulWidget {
  const FavTeamSelect({Key? key}) : super(key: key);

  @override
  _FavTeamSelectState createState() => _FavTeamSelectState();
}

class _FavTeamSelectState extends State<FavTeamSelect> {
  Map teamDataMap = {};

  @override
  Widget build(BuildContext context) {
    teamDataMap = teamDataMap.isNotEmpty
        ? teamDataMap
        : ModalRoute.of(context)!.settings.arguments as Map;
    List<FavoriteCardData> activeTeamData = teamDataMap['teamsList'];
    return Scaffold(
        body: ListView.builder(
      itemCount: activeTeamData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                title: Text('${activeTeamData[index].teamName}'
                    ' | Players: ${activeTeamData[index].playerTagList}'
                    ' | Region: ${activeTeamData[index].region}'),
                leading: SizedBox(
                  width: 60.0,
                  child: Image.network(activeTeamData[index].imgUrl,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                    return Image.asset('assets/bigTurbo.jpg');
                  }, loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      child: Lottie.asset(
                        'assets/lottie/57092-wheel-rotation.json',
                      ),
                    );
                  }),
                ),
                trailing: Icon(Icons.star_border)),
          ),
        );
      },
    ));
    // style: TextStyle(fontSize: 12.0));
  }
}
// https://griffon.octane.gg/teams/BS+COMPETITION.png
// '${teamData['data']['teams'][5]['team']['image']}'))
// child: Image.network(
// '${teamData['data']['teams'][100]['team']['image']}')