import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_culture/governorate.dart';
import 'package:egy_culture/governorate_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GovernoratesScreen extends StatelessWidget {
  const GovernoratesScreen({super.key});

  final List<Governorate> governorates = const [
   Governorate(
  name: 'Cairo',
  imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Cairo_From_Tower_%28cropped%29.jpg/500px-Cairo_From_Tower_%28cropped%29.jpg',
  description:
      'Cairo, Egypt’s sprawling capital, is set on the Nile River. At its heart is Tahrir Square and the vast Egyptian Museum, a trove of antiquities including royal mummies and gilded King Tutankhamun artifacts. Nearby, Giza is the site of the iconic pyramids and Great Sphinx, dating to the 26th century BC.',
),
Governorate(
  name: 'Luxor',
  imageUrl:
      'https://egyptianstreets.com/wp-content/uploads/2024/07/luxor-tours-and-trips.jpg',
  description:
      'Luxor, a city on the east bank of the Nile River in southern Egypt, is on the site of ancient Thebes, the pharaohs’ capital at the height of their power, during the 16th–11th centuries B.C. Today\'s city surrounds 2 huge, surviving ancient monuments: graceful Luxor Temple and Karnak Temple, a mile north.',
),
Governorate(
  name: 'Aswan',
  imageUrl:
      'https://www.traveltoegypt.net/front/images/blog/aswan.jpg',
  description:
      'Aswan, a city on the Nile River, has been southern Egypt’s strategic and commercial gateway since antiquity. It contains significant archaeological sites like the Philae temple complex, on Agilkia Island near the landmark Aswan High Dam.',
),
Governorate(
  name: 'Alexandria',
  imageUrl:
      'https://www.osiristours.com/wp-content/uploads/2016/06/Alexandria-9-e1488051126787.webp',
  description:
      'Alexandria is a Mediterranean port city in Egypt. During the Hellenistic period, it was home to a lighthouse ranking among the Seven Wonders of the Ancient World as well as a storied library. Today the library is reincarnated in the disc-shaped, ultramodern Bibliotheca Alexandrina.',
),
Governorate(
  name: 'South Sinai',
  imageUrl:
      'https://egyptianstreets.com/wp-content/uploads/2021/10/cnn.jpg',
  description:
      'South Sinai is the least populated governorate in Egypt. It is located in the east of the country, encompassing the southern half of the Sinai Peninsula. The governorate is a popular tourist destination due to its beautiful beaches, coral reefs, and historical sites like Saint Catherine\'s Monastery.',
),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourist Governorates'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          final governorate = governorates[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    GovernorateDetailsScreen(governorate: governorate),
              ));
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 20.h),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 5,
              child: Hero(
                tag: governorate.imageUrl,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    CachedNetworkImage(
                      imageUrl: governorate.imageUrl,
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12.w),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        governorate.name,
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
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
}