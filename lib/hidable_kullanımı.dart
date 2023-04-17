import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';

class HidableKullanimiPages extends StatefulWidget {
  const HidableKullanimiPages({Key? key}) : super(key: key);

  @override
  State<HidableKullanimiPages> createState() => _HidableKullanimiPagesState();
}

class _HidableKullanimiPagesState extends State<HidableKullanimiPages> {
  int _index = 0;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) => Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 100,
      ),
      bottomNavigationBar: Hidable(
        controller: _scrollController,
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: bottomNavigationBar(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationBar() {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined, color: Colors.white),
        label: 'Home',
        backgroundColor: Colors.amber.withOpacity(.9),
        activeIcon: const Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite_border, color: Colors.white),
        label: 'Favorites',
        backgroundColor: Colors.blue.withOpacity(.9),
        activeIcon: const Icon(Icons.favorite),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_2_outlined, color: Colors.white),
        label: 'Profile',
        backgroundColor: Colors.green.withOpacity(.9),
        activeIcon: const Icon(Icons.person),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.settings_outlined, color: Colors.white),
        label: 'Settings',
        backgroundColor: Colors.purple.withOpacity(.9),
        activeIcon: const Icon(Icons.settings),
      ),
    ];
  }
}
