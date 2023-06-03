import 'package:card_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../APIs/URLs_Saves.dart';

class carouselWidgetLogos extends StatelessWidget {
  const carouselWidgetLogos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchLogosURL(),
      builder: (BuildContext context,
          AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  const Center(
            child: CardLoading(
              height: 100,
              width: double.infinity,
              borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.2),
                        bottomRight: Radius.circular(20.0),
                      ),
              margin: EdgeInsets.only(bottom: 10),
            ),
                 // Show a loading indicator while fetching data
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
                'Error: An Error Occured'), // Show an error message
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child:
                CircularProgressIndicator(), // Show a message when data is empty
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
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) {
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
    );
  }
}
