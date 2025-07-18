import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Category> categories = [
    Category(
      name: 'Technology',
      icon: Icons.computer,
      color: Colors.blue,
      eventCount: 15,
      description: 'Tech talks, hackathons, and coding workshops',
    ),
    Category(
      name: 'Music',
      icon: Icons.music_note,
      color: Colors.orange,
      eventCount: 8,
      description: 'Concerts, festivals, and music performances',
    ),
    Category(
      name: 'Career',
      icon: Icons.work,
      color: Colors.green,
      eventCount: 12,
      description: 'Career fairs, workshops, and networking',
    ),
    Category(
      name: 'Art',
      icon: Icons.palette,
      color: Colors.purple,
      eventCount: 6,
      description: 'Exhibitions, galleries, and creative workshops',
    ),
    Category(
      name: 'Sports',
      icon: Icons.sports_basketball,
      color: Colors.red,
      eventCount: 20,
      description: 'Games, tournaments, and fitness activities',
    ),
    Category(
      name: 'Academic',
      icon: Icons.school,
      color: Colors.indigo,
      eventCount: 25,
      description: 'Seminars, lectures, and study groups',
    ),
    Category(
      name: 'Social',
      icon: Icons.people,
      color: Colors.pink,
      eventCount: 18,
      description: 'Parties, meetups, and social gatherings',
    ),
    Category(
      name: 'Cultural',
      icon: Icons.language,
      color: Colors.teal,
      eventCount: 10,
      description: 'Cultural celebrations and diversity events',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF6B73FF),
            Color(0xFF9B59B6),
            Colors.white,
          ],
          stops: [0.0, 0.3, 1.0],
        ),
      ),
      child: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              _buildCategoriesHeader(),
              Expanded(
                child: _buildCategoriesGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Explore events by category',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(categories[index], index);
        },
      ),
    );
  }

  Widget _buildCategoryCard(Category category, int index) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey[50]!,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: category.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  category.icon,
                  size: 40,
                  color: category.color,
                ),
              ),
              SizedBox(height: 12),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                '${category.eventCount} events',
                style: TextStyle(
                  fontSize: 14,
                  color: category.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                category.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final int eventCount;
  final String description;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.eventCount,
    required this.description,
  });
}
