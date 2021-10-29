import 'package:flutter/material.dart';
class DropDownTest extends StatefulWidget {
  const DropDownTest({Key? key}) : super(key: key);

  @override
  _DropDownTestState createState() => _DropDownTestState();
}

class _DropDownTestState extends State<DropDownTest> {
  String? dropdownValueRegion = 'All';
  String? dropdownValueTier = 'All';
  String? dropdownValueMode = 'All';
  final regions = ['All','NA','EU','OCE','SAM','ASIA','ME'];
  final tiers = ['All','S','A','B','C','D','Monthly','Weekly','Show Match', 'Qualifier'];
  final modes = ['All','3 v 3', '2 v 2', '1 v 1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0,250,0,50),
              child: DropdownButton(
                value: dropdownValueRegion,
                icon: Icon(Icons.arrow_downward),
                items: regions.map((String regions) {
                  return DropdownMenuItem(
                    value: regions,
                    child: Text(regions)
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueRegion = newValue;
                  });
                },
              ),
            ), //region
            Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,50),
              child: DropdownButton(
                value: dropdownValueTier,
                icon: Icon(Icons.arrow_downward),
                items: tiers.map((String tiers) {
                  return DropdownMenuItem(
                      value: tiers,
                      child: Text(tiers)
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueTier = newValue;
                  });
                },
              ),
            ), //tier
            Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,50),
              child: DropdownButton(
                value: dropdownValueMode,
                icon: Icon(Icons.arrow_downward),
                items: modes.map((String regions) {
                  return DropdownMenuItem(
                      value: regions,
                      child: Text(regions)
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueMode = newValue;
                  });
                },
              ),
            ),
          ],
        )
    ),
    );

  }
}
