import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rl_app/services/get_active_teams.dart';
import 'package:rl_app/widgets/loading_widget.dart';

// Idea for layout is:
// Team logo on top with name below

class DisplaySingleTeam extends StatefulWidget {
  const DisplaySingleTeam({Key? key}) : super(key: key);

  @override
  _DisplaySingleTeamState createState() => _DisplaySingleTeamState();
}

class _DisplaySingleTeamState extends State<DisplaySingleTeam> {
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
