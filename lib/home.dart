import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:top_sites/details.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'model.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  
  List<dynamic>? topData = [];
  List<dynamic>? otherData = [];
  List<dynamic>? imgURLS = [];
  


  ///

  @override
  void initState() {
    super.initState();
    fetchTopData();
    fetchOtherData();
    fetchLogosURL();
    
  }

  // Future<void> fetchTopData() async {
  //   try {
  //     final response = await http.get(Uri.parse('https://api.jsonbin.io/v3/b/6473d4659d312622a36703a1'));
  //     if (response.statusCode == 200) {
  //       final responseBody = response.body;
  //       if (responseBody != null) {
  //         final parsedData = json.decode(responseBody)['record']['data'];
          
  //         setState(() {
  //           topData = parsedData;
            
  //         });
  //       }
  //     } else {
  //      setState(() {
  //       topData = []; // Set an empty list to indicate no data
  //     });
      
    
  //     }
  //   } catch (error) {
  //     setState(() {
  //     topData = []; // Set an empty list to indicate no data
  //   });
    
  // }
  // }


  Future<List<dynamic>> fetchTopData() async {
  try {
    final response = await http.get(Uri.parse('https://api.jsonbin.io/v3/b/6473d4659d312622a36703a1'));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      if (responseBody != null) {
        final parsedData = json.decode(responseBody)['record']['data'];
        return parsedData;
      }
    }
  } catch (error) {
    print('Error fetching data: $error');
  }
  
  return []; // Set an empty list to indicate no data
}


//others data

Future<void> fetchOtherData() async {
    try {
      final response = await http.get(Uri.parse('https://api.jsonbin.io/v3/b/647449899d312622a36732fb'));
      if (response.statusCode == 200) {
        final responseBody = response.body;
       
        if (responseBody != null) {
          final parsedData = json.decode(responseBody)['record']['data'];
          
          setState(() {
            otherData = parsedData;
            
          });
        }
      } else {
       setState(() {
        otherData = []; // Set an empty list to indicate no data
      });
      
    
      }
    } catch (error) {
      setState(() {
      otherData = []; // Set an empty list to indicate no data
    });
    
  }
  }



  
  Future<List<dynamic>> fetchLogosURL() async {
  try {
    final response =
        await http.get(Uri.parse('https://api.jsonbin.io/v3/b/64745339b89b1e2299a6aaef'));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      
      if (responseBody != null) {
        final parsedData = json.decode(responseBody)['record']['data'];
        return parsedData;
      }
    }
    return []; // Set an empty list to indicate no data
  } catch (error) {
    return []; // Set an empty list to indicate no data
  }
}









  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFcbe6f6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.05,
                vertical: deviceSize.height * 0.03),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
                  //! carousel
              FutureBuilder<List<dynamic>>(
                future: fetchLogosURL(),
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(), // Show a loading indicator while fetching data
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error: An Error Occured'), // Show an error message
                    );
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(), // Show a message when data is empty
                    );
                  } else {
                    return SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: false,
                          viewportFraction: 0.9,
                          aspectRatio: 2.0,
                          initialPage: 2,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          final site = snapshot.data![itemIndex];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.2),
                                  bottomRight: Radius.circular(20.0),
                                ),
                                child: Image.network(
                                  site['site_img'],
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
    
              
              
    
              const SizedBox(
                height: 15,
              ),
              // Normal Text
              const Text("Top Sites"),
    
              //!first container
              FutureBuilder<List<dynamic>>(
  future: fetchTopData(),
  builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(), // Show a loading indicator while fetching data
      );
    } else if (snapshot.hasError) {
      return const Center(
        child: Text('Error: An Error Occurred'), // Show an error message
      );
    } else if (snapshot.data == null || snapshot.data!.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(), // Show a message when data is empty
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
                    Get.to(const DetailsPage(), arguments: {
                      'siteImgURL': site['site_logo'],
                      'siteName': site['site_name'].toString().toUpperCase(),
                      'siteDisc': site['site_Desc'].toString(),
                      'siteLink': site['site_link'].toString().toLowerCase(),
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
                        title: Text(site['site_name'], textAlign: TextAlign.center),
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
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return const Center(child: Text('Failed to load image'));
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
),

              
    
              const SizedBox(
                height: 15,
              ),
              //! Second container()
              const Text("others"),
              SizedBox(
                  height: 400,
                  child: 
                  otherData == null
                  ? const Center(
                      child: Text('No data available.'), // Show a loading indicator while fetching data
                    )
                  : otherData!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(), // Show a message when data is empty
                        )
                  :GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                    ),
                    itemCount: otherData!.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      //final site = getSites[index];
                      final site = otherData![index];
                      return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(const DetailsPage(), arguments: {
                                'siteImgURL': site['site_logo'],
                                'siteName':
                                    site['site_name'].toString().toUpperCase(),
                                'siteDisc': site['site_Desc'].toString(),
                                'siteLink': site['site_link'].toString().toLowerCase(),
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
                                    
                                    Text(site['site_name'],
                                        textAlign: TextAlign.center,
                                        style: AppBlackTextStyle.texth2),
                                    Text(site['site_Desc'],
                                        textAlign: TextAlign.center,
                                        style: AppBlackTextStyle.textpBlack),
                                  ],
                                )),
                          ));
                    },
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
