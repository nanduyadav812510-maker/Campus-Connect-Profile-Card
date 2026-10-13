import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int selectedIndex = 0;

  final List<String> menuItems = [
    'Home',
    'About',
    'Skills',
    'Qualifications',
    'Contact',
  ];

  void changePage(int index) { 
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // TOP APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.home,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'My Portfolio',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // PROFILE HEADER
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.18),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // PROFILE IMAGE
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xffeaf3ff),

                      // Replace this with your image:
                      backgroundImage: AssetImage(
                        'assets/profile.jpg',
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Nandini Gurram',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'B.Tech - Artificial Intelligence & Data Science',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // NAVIGATION BUTTONS
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        menuItems.length,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 8),
                            child: OutlinedButton.icon(
                              onPressed: () {
                                changePage(index);
                              },
                              icon: Icon(
                                getIcon(index),
                                size: 17,
                              ),
                              label: Text(menuItems[index]),
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    selectedIndex == index
                                        ? Colors.white
                                        : Colors.black87,
                                backgroundColor:
                                    selectedIndex == index
                                        ? Colors.blue
                                        : Colors.white,
                                side: BorderSide(
                                  color: selectedIndex == index
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // PAGE CONTENT
            getPageContent(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  IconData getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.person;
      case 2:
        return Icons.star;
      case 3:
        return Icons.school;
      case 4:
        return Icons.contact_page;
      default:
        return Icons.home;
    }
  }

  Widget getPageContent() {
    switch (selectedIndex) {
      case 0:
        return homePage();

      case 1:
        return aboutPage();

      case 2:
        return skillsPage();

      case 3:
        return qualificationsPage();

      case 4:
        return contactPage();

      default:
        return homePage();
    }
  }

  // HOME PAGE
  Widget homePage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to My Portfolio',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Hello! I am Nandini, a 3rd-year Artificial Intelligence '
            'and Data Science student. I am passionate about technology, '
            'programming and creating beautiful applications.',
            style: TextStyle(
              fontSize: 17,
              height: 1.6,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 25),

          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              'Explore My Portfolio',
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ABOUT PAGE
  Widget aboutPage() {
    return pageCard(
      title: 'About Me',
      icon: Icons.person,
      child: const Text(
        'I am a 3rd-year B.Tech student specializing in '
        'Artificial Intelligence and Data Science. '
        'I enjoy learning new technologies and developing '
        'creative software applications.',
        style: TextStyle(
          fontSize: 17,
          height: 1.6,
        ),
      ),
    );
  }

  // SKILLS PAGE
  Widget skillsPage() {
    return pageCard(
      title: 'My Skills',
      icon: Icons.star,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          skillChip('Python'),
          skillChip('Flutter'),
          skillChip('Dart'),
          skillChip('Java'),
          skillChip('HTML'),
          skillChip('CSS'),
          skillChip('SQL'),
          skillChip('Machine Learning'),
        ],
      ),
    );
  }

  Widget skillChip(String text) {
    return Chip(
      avatar: const Icon(
        Icons.check_circle,
        color: Colors.blue,
        size: 18,
      ),
      label: Text(text),
      backgroundColor: const Color(0xffeef6ff),
      side: BorderSide.none,
    );
  }

  // QUALIFICATIONS PAGE
  Widget qualificationsPage() {
    return pageCard(
      title: 'Qualifications',
      icon: Icons.school,
      child: Column(
        children: [
          qualificationItem(
            'B.Tech - AI & Data Science',
            '3rd Year',
            'CGPA: 8.1',
          ),
          qualificationItem(
            'NPTEL Certification',
            'Java',
            'Certified',
          ),
        ],
      ),
    );
  }

  Widget qualificationItem(
    String title,
    String subtitle,
    String result,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xfff5f9ff),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.school,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  result,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // CONTACT PAGE
  Widget contactPage() {
    return pageCard(
      title: 'Contact Me',
      icon: Icons.contact_page,
      child: Column(
        children: [
          contactItem(
            Icons.email,
            'Email',
            'yourmail@gmail.com',
          ),
          contactItem(
            Icons.phone,
            'Phone',
            '+91 XXXXX XXXXX',
          ),
          contactItem(
            Icons.location_on,
            'Location',
            'Guntur, Andhra Pradesh',
          ),
        ],
      ),
    );
  }

  Widget contactItem(
    IconData icon,
    String title,
    String value,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xffeaf3ff),
        child: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(value),
    );
  }

  // COMMON CARD
  Widget pageCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 28,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          child,
        ],
      ),
    );
  }
}