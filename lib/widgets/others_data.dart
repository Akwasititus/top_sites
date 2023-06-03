import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../APIs/URLs_Saves.dart';
import '../constants.dart';
import '../details.dart';

class FatchOtherData extends StatelessWidget {
  const FatchOtherData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
                future: fetchOtherData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child:
                          CircularProgressIndicator(
                            strokeWidth: 1,
                          ), // Show a loading indicator while fetching data
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                          'Error: An Error Occurred'), // Show an error message
                    );
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(
                      child:
                          CircularProgressIndicator(), // Show a message when data is empty
                    );
                  } else {
                    return SizedBox(
                      height: 400,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns in the grid
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final site = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(const DetailsPage(), arguments: {
                                  'siteImgURL': site['site_logo'],
                                  'siteName': site['site_name']
                                      .toString()
                                      .toUpperCase(),
                                  'siteDisc': site['site_Desc'].toString(),
                                  'siteLink': site['site_link']
                                      .toString()
                                      .toLowerCase(),
                                });
                              },
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      site['site_name'],
                                      textAlign: TextAlign.center,
                                      style: AppBlackTextStyle.texth2,
                                    ),
                                    Text(
                                      site['site_Desc'],
                                      textAlign: TextAlign.center,
                                      style: AppBlackTextStyle.textpBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              );
  }
}