import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final String organizer;
  final String category;
  final Color categoryColor;
  final IconData icon;
  final List<Color> gradientColors;
  int attendees;
  bool isRSVP;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.organizer,
    required this.category,
    required this.categoryColor,
    required this.icon,
    required this.gradientColors,
    required this.attendees,
    this.isRSVP = false,
  });
}

class EventsData {
  static final List<Event> events = [
    // Technology Events
    Event(
      title: 'Tech Talk: AI & ML',
      description: 'Join us for an exciting discussion about Artificial Intelligence and Machine Learning trends in 2025. Learn from industry experts and network with fellow tech enthusiasts.',
      date: 'August 15, 2025',
      time: '2:00 PM',
      location: 'Computer Science Building, Room 101',
      organizer: 'CS Department',
      category: 'Technology',
      categoryColor: Colors.blue,
      icon: Icons.computer,
      gradientColors: [Color(0xFF667eea), Color(0xFF764ba2)],
      attendees: 245,
    ),
    Event(
      title: 'Hackathon 2024',
      description: 'Join the biggest coding competition of the year! Build innovative solutions in 48 hours with your team. Prizes worth \$10,000 await the winners.',
      date: 'August 22, 2025',
      time: '9:00 AM',
      location: 'Innovation Hub, Building C',
      organizer: 'Tech Club',
      category: 'Technology',
      categoryColor: Colors.blue,
      icon: Icons.code,
      gradientColors: [Color(0xFF3D4AE8), Color(0xFF6B73FF)],
      attendees: 156,
    ),
    Event(
      title: 'Web Development Workshop',
      description: 'Learn modern web development with React, Node.js, and MongoDB. Hands-on workshop with industry mentors.',
      date: 'September 2, 2025',
      time: '10:00 AM',
      location: 'Computer Lab 2, CS Building',
      organizer: 'Web Development Society',
      category: 'Technology',
      categoryColor: Colors.blue,
      icon: Icons.web,
      gradientColors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
      attendees: 89,
    ),
    Event(
      title: 'Cybersecurity Seminar',
      description: 'Understanding modern cyber threats and how to protect yourself. Expert speakers from leading cybersecurity firms.',
      date: 'September 8, 2025',
      time: '1:00 PM',
      location: 'Auditorium A',
      organizer: 'InfoSec Club',
      category: 'Technology',
      categoryColor: Colors.blue,
      icon: Icons.security,
      gradientColors: [Color(0xFF0F0C29), Color(0xFF302B63)],
      attendees: 178,
    ),

    // Music Events
    Event(
      title: 'Spring Music Festival',
      description: 'Experience the best of student talent at our annual Spring Music Festival. Live performances, food trucks, and amazing vibes!',
      date: 'August 20, 2025',
      time: '6:00 PM',
      location: 'Main Campus Quad',
      organizer: 'Student Union',
      category: 'Music',
      categoryColor: Colors.orange,
      icon: Icons.music_note,
      gradientColors: [Color(0xFFf093fb), Color(0xFFf5576c)],
      attendees: 892,
    ),
    Event(
      title: 'Jazz Night',
      description: 'An evening of smooth jazz performances by our talented music students and special guest artists.',
      date: 'August 28, 2025',
      time: '8:00 PM',
      location: 'Music Hall',
      organizer: 'Music Department',
      category: 'Music',
      categoryColor: Colors.orange,
      icon: Icons.music_video,
      gradientColors: [Color(0xFFFF6B6B), Color(0xFFFFE66D)],
      attendees: 234,
    ),
    Event(
      title: 'Battle of the Bands',
      description: 'Local bands compete for the title of Best College Band. Vote for your favorite!',
      date: 'September 12, 2025',
      time: '7:00 PM',
      location: 'Student Center Plaza',
      organizer: 'Music Society',
      category: 'Music',
      categoryColor: Colors.orange,
      icon: Icons.queue_music,
      gradientColors: [Color(0xFFFF9A8B), Color(0xFFA8E6CF)],
      attendees: 456,
    ),

    // Career Events
    Event(
      title: 'Career Fair 2024',
      description: 'Meet with top employers and explore career opportunities. Bring your resume and dress professionally for this networking event.',
      date: 'August 25, 2025',
      time: '10:00 AM',
      location: 'University Center',
      organizer: 'Career Services',
      category: 'Career',
      categoryColor: Colors.green,
      icon: Icons.work,
      gradientColors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
      attendees: 567,
    ),
    Event(
      title: 'Resume Building Workshop',
      description: 'Learn how to create a professional resume that stands out. Get personalized feedback from career counselors.',
      date: 'August 18, 2025',
      time: '3:00 PM',
      location: 'Career Services Office',
      organizer: 'Career Services',
      category: 'Career',
      categoryColor: Colors.green,
      icon: Icons.description,
      gradientColors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
      attendees: 123,
    ),
    Event(
      title: 'LinkedIn Optimization Session',
      description: 'Maximize your LinkedIn profile to attract recruiters and build professional connections.',
      date: 'September 5, 2025',
      time: '2:00 PM',
      location: 'Conference Room B',
      organizer: 'Professional Development Club',
      category: 'Career',
      categoryColor: Colors.green,
      icon: Icons.person_add,
      gradientColors: [Color(0xFF667eea), Color(0xFF764ba2)],
      attendees: 87,
    ),

    // Art Events
    Event(
      title: 'Art Exhibition',
      description: 'Discover amazing artwork created by our talented art students. From paintings to sculptures, explore creativity at its finest.',
      date: 'August 30, 2025',
      time: '1:00 PM',
      location: 'Art Gallery, Fine Arts Building',
      organizer: 'Art Department',
      category: 'Art',
      categoryColor: Colors.purple,
      icon: Icons.palette,
      gradientColors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
      attendees: 156,
    ),
    Event(
      title: 'Photography Workshop',
      description: 'Learn the basics of photography, composition, and editing. Bring your camera or smartphone!',
      date: 'September 7, 2025',
      time: '11:00 AM',
      location: 'Art Studio 3',
      organizer: 'Photography Club',
      category: 'Art',
      categoryColor: Colors.purple,
      icon: Icons.camera_alt,
      gradientColors: [Color(0xFFffecd2), Color(0xFFfcb69f)],
      attendees: 92,
    ),
    Event(
      title: 'Digital Art Showcase',
      description: 'Explore the latest in digital art and design. Interactive displays and VR art experiences.',
      date: 'September 15, 2025',
      time: '4:00 PM',
      location: 'Digital Media Lab',
      organizer: 'Digital Arts Society',
      category: 'Art',
      categoryColor: Colors.purple,
      icon: Icons.brush,
      gradientColors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
      attendees: 134,
    ),

    // Sports Events
    Event(
      title: 'Basketball Championship',
      description: 'Cheer for our college team in the final championship game. Free snacks and drinks for all students!',
      date: 'September 5, 2025',
      time: '7:00 PM',
      location: 'Sports Complex',
      organizer: 'Athletics Department',
      category: 'Sports',
      categoryColor: Colors.red,
      icon: Icons.sports_basketball,
      gradientColors: [Color(0xFFff9a9e), Color(0xFFfecfef)],
      attendees: 1234,
    ),
    Event(
      title: 'Intramural Soccer Tournament',
      description: 'Join the inter-department soccer competition. Form your team and compete for the trophy!',
      date: 'August 23, 2025',
      time: '4:00 PM',
      location: 'Soccer Field',
      organizer: 'Sports Committee',
      category: 'Sports',
      categoryColor: Colors.red,
      icon: Icons.sports_soccer,
      gradientColors: [Color(0xFF56ab2f), Color(0xFFa8e6cf)],
      attendees: 345,
    ),
    Event(
      title: 'Fitness Challenge',
      description: 'Test your fitness levels with various challenges. Prizes for top performers in each category.',
      date: 'September 10, 2025',
      time: '6:00 AM',
      location: 'Gymnasium',
      organizer: 'Fitness Club',
      category: 'Sports',
      categoryColor: Colors.red,
      icon: Icons.fitness_center,
      gradientColors: [Color(0xFFffeaa7), Color(0xFFfab1a0)],
      attendees: 198,
    ),

    // Academic Events
    Event(
      title: 'Research Symposium',
      description: 'Undergraduate research presentations across all departments. Learn about cutting-edge research projects.',
      date: 'August 27, 2025',
      time: '9:00 AM',
      location: 'Academic Building, Various Rooms',
      organizer: 'Research Office',
      category: 'Academic',
      categoryColor: Colors.indigo,
      icon: Icons.school,
      gradientColors: [Color(0xFF667eea), Color(0xFF764ba2)],
      attendees: 289,
    ),
    Event(
      title: 'Study Abroad Information Session',
      description: 'Learn about international exchange programs and study abroad opportunities.',
      date: 'September 3, 2025',
      time: '12:00 PM',
      location: 'International Office',
      organizer: 'International Programs',
      category: 'Academic',
      categoryColor: Colors.indigo,
      icon: Icons.flight,
      gradientColors: [Color(0xFF74b9ff), Color(0xFF0984e3)],
      attendees: 167,
    ),
    Event(
      title: 'Graduate School Fair',
      description: 'Meet representatives from top graduate programs. Get information about admissions and scholarships.',
      date: 'September 14, 2025',
      time: '11:00 AM',
      location: 'Student Union Ballroom',
      organizer: 'Academic Affairs',
      category: 'Academic',
      categoryColor: Colors.indigo,
      icon: Icons.school_outlined,
      gradientColors: [Color(0xFF6c5ce7), Color(0xFFa29bfe)],
      attendees: 234,
    ),

    // Social Events
    Event(
      title: 'Welcome Back Party',
      description: 'Kick off the new semester with music, dancing, and socializing. Meet new friends and reconnect with old ones.',
      date: 'August 16, 2025',
      time: '8:00 PM',
      location: 'Student Union Ballroom',
      organizer: 'Student Activities',
      category: 'Social',
      categoryColor: Colors.pink,
      icon: Icons.people,
      gradientColors: [Color(0xFFfd79a8), Color(0xFFfdcb6e)],
      attendees: 456,
    ),
    Event(
      title: 'Game Night',
      description: 'Board games, video games, and card games. Snacks and prizes included!',
      date: 'August 29, 2025',
      time: '7:00 PM',
      location: 'Recreation Center',
      organizer: 'Gaming Club',
      category: 'Social',
      categoryColor: Colors.pink,
      icon: Icons.videogame_asset,
      gradientColors: [Color(0xFFe17055), Color(0xFFfdcb6e)],
      attendees: 123,
    ),
    Event(
      title: 'International Food Festival',
      description: 'Taste authentic cuisines from around the world prepared by our international students.',
      date: 'September 11, 2025',
      time: '5:00 PM',
      location: 'Campus Plaza',
      organizer: 'International Student Association',
      category: 'Social',
      categoryColor: Colors.pink,
      icon: Icons.restaurant,
      gradientColors: [Color(0xFFff7675), Color(0xFFe84393)],
      attendees: 567,
    ),

    // Cultural Events
    Event(
      title: 'Cultural Heritage Week',
      description: 'Celebrate the diverse cultures represented on our campus through performances, food, and exhibitions.',
      date: 'August 26, 2025',
      time: '12:00 PM',
      location: 'Campus-wide',
      organizer: 'Multicultural Affairs',
      category: 'Cultural',
      categoryColor: Colors.teal,
      icon: Icons.language,
      gradientColors: [Color(0xFF00b894), Color(0xFF00cec9)],
      attendees: 678,
    ),
    Event(
      title: 'Poetry Reading Night',
      description: 'Share your original poetry or listen to beautiful verses from fellow students and faculty.',
      date: 'September 1, 2025',
      time: '7:30 PM',
      location: 'Library Auditorium',
      organizer: 'English Department',
      category: 'Cultural',
      categoryColor: Colors.teal,
      icon: Icons.auto_stories,
      gradientColors: [Color(0xFF74b9ff), Color(0xFF0984e3)],
      attendees: 89,
    ),
    Event(
      title: 'Dance Performance Showcase',
      description: 'Experience various dance styles from classical to contemporary performed by student groups.',
      date: 'September 13, 2025',
      time: '6:30 PM',
      location: 'Performing Arts Theater',
      organizer: 'Dance Ensemble',
      category: 'Cultural',
      categoryColor: Colors.teal,
      icon: Icons.theater_comedy,
      gradientColors: [Color(0xFFfd79a8), Color(0xFFe84393)],
      attendees: 345,
    ),
  ];

  static List<Event> getEventsByCategory(String category) {
    return events.where((event) => 
      event.category.toLowerCase() == category.toLowerCase()
    ).toList();
  }

  static int getEventCountByCategory(String category) {
    return getEventsByCategory(category).length;
  }

  static List<Event> searchEvents(String query) {
    if (query.isEmpty) return events;
    
    final lowercaseQuery = query.toLowerCase();
    return events.where((event) {
      return event.title.toLowerCase().contains(lowercaseQuery) ||
             event.description.toLowerCase().contains(lowercaseQuery) ||
             event.category.toLowerCase().contains(lowercaseQuery) ||
             event.organizer.toLowerCase().contains(lowercaseQuery) ||
             event.location.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  static List<String> getAllCategories() {
    return events.map((event) => event.category).toSet().toList();
  }

  static List<String> getAllOrganizers() {
    return events.map((event) => event.organizer).toSet().toList();
  }
}
