import 'package:appjamai/Screens/profilScreen.dart';
import 'package:flutter/material.dart';

import 'GalleryScreen.dart';
import 'homeScreen.dart';

class GalleryScreen extends StatefulWidget {
  static const String routeName = 'GalleryScreen';

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _currentIndex = 0;

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
        title: Text('Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            _buildPlantCard('Otsu Bitkiler', Icons.grass),
            _buildPlantCard('Çalı Bitkiler', Icons.local_florist),
            _buildPlantCard('Ağaç Türleri', Icons.park),
            _buildPlantCard('Tırmanıcı Bitkiler', Icons.terrain),
            _buildPlantCard('Sukulentler', Icons.eco),
            _buildPlantCard('Tropikal Bitkiler', Icons.brightness_5),
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

  Widget _buildPlantCard(String title, IconData icon) {
    return Card(
      color: Colors.green[100],
      child: InkWell(
        onTap: () {
          // İlgili bitki türü için yapılacak işlemler burada
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 48, color: Colors.green),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
