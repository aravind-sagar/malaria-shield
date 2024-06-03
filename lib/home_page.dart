import 'package:flutter/material.dart';
import 'package:malaria_shield/recoerds.dart';
import 'account_page.dart';
import 'authentication.dart';
import "package:malaria_shield/map_Page.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    mapPage(),
    records(),
    AccountPage(
        userData: UserData(
      name: "Your Name",
      dob: DateTime.now(), // Use DOB instead of age
      location: "Your Location",
      bloodGroup: "Your Blood Group",
      gender: "Your Gender",
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.6),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Malaria Shield!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Malaria: Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Malaria is a life-threatening disease caused by parasites that are transmitted to people through the bites of infected female Anopheles mosquitoes. It is preventable and curable.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Causes of Malaria',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Malaria is caused by Plasmodium parasites. The parasites are spread to people through the bites of infected mosquitoes. There are five parasite species that cause malaria in humans, and two of these species – Plasmodium falciparum and Plasmodium vivax – pose the greatest threat.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '- Plasmodium falciparum: This is the most dangerous malaria parasite and is responsible for most malaria-related deaths globally.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '- Plasmodium vivax: This parasite is less deadly but more widespread, often causing recurring infections.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '- Plasmodium ovale and Plasmodium malariae: These are less common and usually cause milder forms of malaria.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '- Plasmodium knowlesi: Found in Southeast Asia, this species primarily infects macaques but can also infect humans.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Symptoms of Malaria',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'The symptoms of malaria typically appear 10-15 days after the infective mosquito bite. Common symptoms include:',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '- Fever and chills\n- Headache\n- Nausea and vomiting\n- Muscle pain and fatigue\n- Sweating\n- Chest or abdominal pain\n- Cough',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Precautions to Prevent Malaria',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '1. Avoid Mosquito Bites:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '- Use Mosquito Nets: Sleep under insecticide-treated mosquito nets (ITNs) to reduce mosquito bites during the night.\n'
            '- Apply Insect Repellent: Use insect repellents on exposed skin and clothing. Repellents containing DEET, picaridin, or IR3535 are effective.\n'
            '- Wear Protective Clothing: Wear long-sleeved shirts and long pants, especially during dusk and dawn when mosquitoes are most active.\n'
            '- Stay in Well-Screened Areas: Use air conditioning and screens on windows and doors to keep mosquitoes out.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '2. Indoor Residual Spraying (IRS):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Regularly spray the inside of your home with insecticides to kill mosquitoes and reduce the risk of transmission.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '3. Preventive Medication:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Take antimalarial medications as prescribed, especially when traveling to areas where malaria is common.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
