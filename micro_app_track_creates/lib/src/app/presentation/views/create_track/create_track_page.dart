import 'package:commons_design_system/main.dart';
import 'package:commons_shared/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../track_controller.dart';
import '../launch/distance_page.dart';
import '../launch/speed_page.dart';
import '../launch/timer_page.dart';

class CreateTrackPage extends StatefulWidget {
  @override
  _CreateTrackPageState createState() => _CreateTrackPageState();
}

class _CreateTrackPageState extends State<CreateTrackPage> {
  final TrackController controller = Modular.get<TrackController>();
  final PageController _pageController = PageController();

  List<RadioModel> radioModels = [];

  @override
  void initState() {
    super.initState();

    this.radioModels
      ..add(
        new RadioModel(
          true,
          RadioModelLocation.first,
          LaunchTypeDescription.getDescription(LaunchType.speed),
          onTap: () {
            controller.resetLaunch(LaunchType.speed);

            _pageController.animateToPage(0,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
        ),
      )
      ..add(
        new RadioModel(
          false,
          RadioModelLocation.middle,
          LaunchTypeDescription.getDescription(LaunchType.distance),
          onTap: () {
            controller.resetLaunch(LaunchType.distance);

            _pageController.animateToPage(1,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
        ),
      )
      ..add(
        new RadioModel(
          false,
          RadioModelLocation.last,
          LaunchTypeDescription.getDescription(LaunchType.time),
          onTap: () {
            controller.launch.selectLaunchType(LaunchType.time);

            _pageController.animateToPage(2,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTypes,
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int pageNumber) {
              KeyboardUtils.close(context);
            },
            children: <Widget>[
              SpeedPage(),
              DistancePage(),
              TimerPage(),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _buildTypes => Container(
        height: 50,
        child: RadioGroup(
          radioModels,
          activeBorderWidth: 1,
        ),
      );
}
