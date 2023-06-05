import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:top_sites/details.dart';

import 'APIs/URLs_Saves.dart';
import 'causeDetails.dart';
import 'constants.dart';

import 'widgets/carousel_widget_logos.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/others_data.dart';
import 'widgets/top_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchTopData();
    fetchOtherData();
    fetchLogosURL();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Top Sites'),
        ),
        
        backgroundColor: MyTheme.courseCardColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.05,
                vertical: deviceSize.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 10,
                ),

                //! carousel
                carouselWidgetLogos(),

                SizedBox(
                  height: 15,
                ),
                // Normal Text
                Text("Top Sites"),

                //!first container
                TopData(),
                SizedBox(
                  height: 15,
                ),
                //! Second container()
                Text("others"),
                FatchOtherData(),
              ],
            ),
          ),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
