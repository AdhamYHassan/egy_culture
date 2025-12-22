import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_culture/cultural_site.dart';
import 'package:egy_culture/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CulturalSite> sites = const [
    CulturalSite(
      name: 'Giza Pyramids',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/All_Gizah_Pyramids.jpg/1280px-All_Gizah_Pyramids.jpg',
      description:
          'The Giza pyramid complex is an archaeological site on the Giza Plateau, on the outskirts of Cairo, Egypt. It includes the three Great Pyramids (Khufu/Cheops, Khafre/Chephren, and Menkaure/Mykerinos), the Great Sphinx, several cemeteries, a workers\' village and an industrial complex.',
    ),
    CulturalSite(
      name: 'Great Sphinx',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Great_Sphinx_of_Giza_-_20080716a.jpg/1280px-Great_Sphinx_of_Giza_-_20080716a.jpg',
      description:
          'The Great Sphinx of Giza is a limestone statue of a reclining sphinx, a mythical creature with the body of a lion and the head of a human. Facing directly from West to East, it stands on the Giza Plateau on the west bank of the Nile in Giza, Egypt. The face of the Sphinx is generally believed to represent the pharaoh Khafre.',
    ),
    CulturalSite(
      name: 'Grand Egyptian Museum',
      imageUrl:
          'https://www.visit-gem.com/storage/informations/1752589691_1737030068_DSC00437-min.jpeg',
      description:
          'The Grand Egyptian Museum (GEM), also known as the Giza Museum, is an archaeological museum under construction in Giza, Egypt. When inaugurated, the GEM will be the largest archaeological museum in the world. It will house artifacts of ancient Egypt, including the complete Tutankhamun collection; many pieces will be displayed for the first time.',
    ),
    CulturalSite(
      name: 'Karnak Temple',
      imageUrl:
          'https://www.historyhit.com/app/uploads/bis-images/5166575/shutterstock_Karnak-Temple-1-1576x1074.jpg',
      description:
          'The Karnak Temple Complex, commonly known as Karnak, comprises a vast mix of decayed temples, chapels, pylons, and other buildings near Luxor, in Egypt. Construction at the complex began during the reign of Senusret I in the Middle Kingdom and continued into the Ptolemaic period.',
    ),
    CulturalSite(
      name: 'Abu Simbel',
      imageUrl:
          'https://www.luxorandaswan.com/images/16804026370abo-simbel-1-1.jpg',
      description:
          'The Abu Simbel temples are two massive rock-cut temples at Abu Simbel, a village in Aswan Governorate, Upper Egypt, near the border with Sudan. They are situated on the western bank of Lake Nasser, about 230 km southwest of Aswan.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Egyptian Culture'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: sites.length,
        itemBuilder: (context, index) {
          final site = sites[index];
          return _buildSiteCard(context, site);
        },
      ),
    );
  }

  Widget _buildSiteCard(BuildContext context, CulturalSite site) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailsScreen(site: site)),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 20.h),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: site.imageUrl,
              child: CachedNetworkImage(
                imageUrl: site.imageUrl,
                height: 200.h,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                site.name,
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
