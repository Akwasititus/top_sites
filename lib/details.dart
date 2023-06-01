import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();

}

class _DetailsPageState extends State<DetailsPage> {

   
  @override
  Widget build(BuildContext context) {
   
   final getSelectedSites = Get.arguments;
    final Uri _url = Uri.parse('${getSelectedSites['siteLink']}');

    Future<void> launchURL() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }


    return   SafeArea(
      child: Scaffold(
         backgroundColor: Colors.white,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: GridTile(
                 header: GridTileBar(
                    leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                          ),
                  ),
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xFFcbe6f6),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                            )),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(getSelectedSites['siteName'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF474A56))),
                      const SizedBox(height: 10.00),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(getSelectedSites['siteDisc'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF474A56))),
                      ),
                        
                      ],
                    ),
                    ),
              ),
            ),
              Flexible(
              child:  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                          getSelectedSites['siteImgURL'],
                          height: 200,
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        launchURL();
                        },
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFcbe6f6),
                          borderRadius: BorderRadius.circular(10)),
                          child: const Center(child: Text('Visit site',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.black))),
                      ),
                    )
                  ],
                ),
              ),
               
            ),
          ],
        )
        ),
    );
  }
}