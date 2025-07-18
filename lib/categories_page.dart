import 'package:flutter/material.dart';
import 'constants/events_data.dart';

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
      eventCount: EventsData.getEventCountByCategory('Technology'),
      description: 'Tech talks, hackathons, and coding workshops',
    ),
    Category(
      name: 'Music',
      icon: Icons.music_note,
      color: Colors.orange,
      eventCount: EventsData.getEventCountByCategory('Music'),
      description: 'Concerts, festivals, and music performances',
    ),
    Category(
      name: 'Career',
      icon: Icons.work,
      color: Colors.green,
      eventCount: EventsData.getEventCountByCategory('Career'),
      description: 'Career fairs, workshops, and networking',
    ),
    Category(
      name: 'Art',
      icon: Icons.palette,
      color: Colors.purple,
      eventCount: EventsData.getEventCountByCategory('Art'),
      description: 'Exhibitions, galleries, and creative workshops',
    ),
    Category(
      name: 'Sports',
      icon: Icons.sports_basketball,
      color: Colors.red,
      eventCount: EventsData.getEventCountByCategory('Sports'),
      description: 'Games, tournaments, and fitness activities',
    ),
    Category(
      name: 'Academic',
      icon: Icons.school,
      color: Colors.indigo,
      eventCount: EventsData.getEventCountByCategory('Academic'),
      description: 'Seminars, lectures, and study groups',
    ),
    Category(
      name: 'Social',
      icon: Icons.people,
      color: Colors.pink,
      eventCount: EventsData.getEventCountByCategory('Social'),
      description: 'Parties, meetups, and social gatherings',
    ),
    Category(
      name: 'Cultural',
      icon: Icons.language,
      color: Colors.teal,
      eventCount: EventsData.getEventCountByCategory('Cultural'),
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
    return GestureDetector(
      onTap: () => _showCategoryEvents(category),
      child: Card(
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
      ),
    );
  }

  void _showCategoryEvents(Category category) {
    final categoryEvents = EventsData.getEventsByCategory(category.name);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [category.color.withOpacity(0.8), category.color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Icon(category.icon, color: Colors.white, size: 30),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${category.name} Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${categoryEvents.length} events available',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: categoryEvents.length,
                itemBuilder: (context, index) {
                  final event = categoryEvents[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              event.description,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
                                SizedBox(width: 4),
                                Text(
                                  event.date,
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                                SizedBox(width: 16),
                                Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
                                SizedBox(width: 4),
                                Text(
                                  event.time,
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
