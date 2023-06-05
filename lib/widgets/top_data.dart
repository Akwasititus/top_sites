import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../APIs/URLs_Saves.dart';
import '../causeDetails.dart';
import '../details.dart';

class TopData extends StatelessWidget {
  const TopData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
                future: fetchTopData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child:
                          CircularProgressIndicator(
                            strokeWidth: 1,
                          ) // Show a loading indicator while fetching data
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
                      height: 140,
                      child: Hero(
                        tag: 'hostelImage',
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final site = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to( CourseScreen(), arguments: {
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
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFcbe6f6),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: GridTile(
                                    footer: GridTileBar(
                                      backgroundColor: Colors.black54,
                                      title: Text(site['site_name'],
                                          textAlign: TextAlign.center),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.2),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      child: Image.network(
                                        site['site_logo'],
                                        height: 30,
                                        fit: BoxFit.cover,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const Center(
                                              child:
                                                  Text('Failed to load image'));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              );

  }
}