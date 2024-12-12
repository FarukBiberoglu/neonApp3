import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      'image': 'assets/topkapı.jpg',
      'description': 'Topkapı Sarayı, İstanbul da Osmanlı İmparatorluğu nun yaklaşık 400 yıl boyunca idare, eğitim ve sanat merkezi olarak hizmet vermiş tarihi bir yapıdır. 15. yüzyılda Fatih Sultan Mehmet tarafından yaptırılmış olup, padişahların ikametgahı ve devletin yönetim merkezi olmuştur'
    },
    {
      'image': 'assets/eminonu-gezilecek-yerler-listesi-en-iyi-10-mekan.jpg',
      'description': 'Eminönü, İstanbulun en eski ve en hareketli semtlerinden biridir. Tarihi Yarımadada yer alan bu bölge, Osmanlı ve Bizans dönemlerinden kalma tarihi yapıları, canlı çarşıları ve muhteşem Boğaz manzarasıyla ziyaretçileri büyüler..'
    },
    {
      'image': 'assets/images.jpg',
      'description': 'Sultanahmet Camii, İstanbulun tarihi yarımadasında, Ayasofyanın karşısında yer alan ve "Mavi Cami" olarak da bilinen muhteşem bir Osmanlı eseridir. 1609-1616 yılları arasında Sultan I. Ahmed tarafından Mimar Sedefkâr Mehmed Ağa ya yaptırılmıştır'
    },
    {
      'image': 'assets/s.jpg',
      'description': 'Ayasofya, İstanbul un en ikonik yapılarından biri olup, hem Bizans hem de Osmanlı İmparatorluğu na hizmet etmiş eşsiz bir mimari şaheserdir. 537 yılında Bizans İmparatoru I. Justinianus tarafından kilise olarak inşa edilmiştir. '
    },
    {
      'image': 'assets/yerebatanSarnıcı.jpg',
      'description': 'Yerebatan Sarnıcı, İstanbul’un en etkileyici tarihi yapılarından biri olan devasa bir su deposudur. 6. yüzyılda Bizans İmparatoru I. Justinianus tarafından, şehrin su ihtiyacını karşılamak amacıyla inşa edilmiştir.'
    },
    {
      'image': 'assets/kapaliÇarşı.jpg',
      'description': 'Kapalıçarşı, İstanbul un en eski ve en büyük kapalı alışveriş merkezidir ve şehrin kalbinde, tarihi Yarımada da yer alır.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelEase',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    imagePath: destinations[index]['image']!,
                    description: destinations[index]['description']!,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                destinations[index]['image']!,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String description;

  const DetailPage({
    Key? key,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detaylar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}