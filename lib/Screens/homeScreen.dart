import 'package:appjamai/Screens/profilScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'GalleryScreen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  String _status = 'Henüz fotoğraf seçilmedi';
  int _currentIndex = 0;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _status = 'Fotoğraf seçildi';
      });
    } else {
      setState(() {
        _status = 'Fotoğraf seçilmedi';
      });
    }
  }

  void _showPlantInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bitki Bilgileri'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bitki Türü: Tek yıllık otsu bitki'),
                Text('Bilimsel Adı: Zea mays'),
                Text('Yetiştiği İklim: Tropikal, subtropikal ve ılıman iklimlerde yetişir'),
                Text('Toprak İsteği: Organik maddece zengin, iyi drenajlı ve derin topraklar'),
                Text('Büyüme Süresi: 60-100 gün arasında değişir'),
                Text('Boyutları: Ortalama 2-3 metre boyunda olabilir'),
                Text('Ürün Verimi: Koçan başına yaklaşık 400-600 tane mısır tanesi üretir'),
                Text('Hasat Zamanı: Çiçeklenmeden yaklaşık 18-24 hafta sonra hasat edilir'),
                Text('Kullanım Alanları: İnsan gıdası, hayvan yemi, biyoyakıt ve endüstriyel ürünler'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, GalleryScreen.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ProfilScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitki Tanıma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.photo),
              label: Text('Fotoğraf Yükle'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bitkinizin fotoğrafını yükleyin ve özelliklerini yapay zekaya sorun',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              _status,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32), // Aradaki boşluk arttırıldı
            ElevatedButton(
              onPressed: _showPlantInfo,
              child: Text('Yapay Zekaya Sor'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
