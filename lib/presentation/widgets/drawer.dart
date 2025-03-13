import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/imgs/prock.jpg'),
              radius: 40,
            ),
            accountName: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Lorem Ipsum',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Baloo-Regular',
                ),
              ),
            ),
            accountEmail: Text(
              'prock@example.com',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Baloo2-Regular',
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/bk99.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color:
                currentRoute == '/popular'
                    ? Colors.grey.shade300
                    : Colors.transparent,
            child: ListTile(
              leading: Icon(
                Icons.trending_up_outlined,
                size: 22,
                color: currentRoute == '/popular' ? Colors.blue : Colors.green,
              ),
              title: Text(
                'Popular',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Baloo2-Regular',
                  fontWeight:
                      currentRoute == '/popular'
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color:
                      currentRoute == '/popular' ? Colors.blue : Colors.black,
                ),
              ),
              onTap: () {
                if (currentRoute != '/popular') {
                  Navigator.pushReplacementNamed(context, '/popular');
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
