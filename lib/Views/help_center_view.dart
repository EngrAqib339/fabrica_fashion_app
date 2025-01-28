import 'package:flutter/material.dart';
import '../controllers/help_center_controller.dart';
import '../widgets/background_circles.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  final HelpCenterController _controller = HelpCenterController();
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = "All";
  bool showFAQs = true; // Toggle between FAQs and Contact Us

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> faqs = _controller.getFAQs(selectedCategory);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Circles
          const BackgroundCircles(),

          // Floating Back Button
          Positioned(
            top: 40,
            left: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),

          // Centered Title
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Help Center',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 300.0),
            child: Text(
              'Insightlancer',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // FAQ & Contact Us Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMainButton("FAQ", showFAQs),
                    _buildMainButton("Contact Us", !showFAQs),
                  ],
                ),
                const SizedBox(height: 15),

                // Floating Filter Buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFilterButton("All"),
                      _buildFilterButton("Services"),
                      _buildFilterButton("General"),
                      _buildFilterButton("Account"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // FAQ List or Contact Us Section
                Expanded(
                  child: showFAQs ? _buildFAQList(faqs) : _buildContactUs(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Button to toggle FAQ and Contact Us
  Widget _buildMainButton(String label, bool isActive) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          showFAQs = (label == "FAQ");
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.brown : Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        label,
        style: TextStyle(color: isActive ? Colors.white : Colors.black),
      ),
    );
  }

  // Filter Buttons
  Widget _buildFilterButton(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = category;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedCategory == category ? Colors.brown : Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          category,
          style: TextStyle(color: selectedCategory == category ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  // FAQ List
  Widget _buildFAQList(List<Map<String, dynamic>> faqs) {
    return ListView.builder(
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            faqs[index]['question'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(faqs[index]['answer']),
            ),
          ],
        );
      },
    );
  }

  // Contact Us Section
  Widget _buildContactUs() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Need more help?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text("Reach out to our support team for assistance."),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Contacting Support...")),
              );
            },
            icon: const Icon(Icons.phone),
            label: const Text("Contact Support"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
