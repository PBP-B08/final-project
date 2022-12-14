import 'package:cultural_center/modules/faq_review/page/faq.dart';
import 'package:cultural_center/modules/faq_review/page/review.dart';
import 'package:cultural_center/modules/recommendation/pages/recommendation.dart';
import '../modules/culture-highlights/screens/culture-highlights-screen.dart';
import '../modules/things-to-do/page/main_things.dart';
import 'package:flutter/material.dart';
import 'package:cultural_center/main.dart';
import 'package:cultural_center/modules/event_calendar/calendar.dart';
import 'package:cultural_center/modules/plan-your-trip/plan.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Cultural Center'),
            leading: const Icon(Icons.home),
            onTap: () {
              // Route to the home page
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: 'Cultural Center',
                      )));
            },
          ),
          ListTile(
            title: const Text('Recommendation'),
            leading: const Icon(Icons.location_city),
            onTap: () {
              // Update the state of the app.
              // close navigation drawer before
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const RecommendationPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Plan Your Trip'),
            leading: const Icon(Icons.airplane_ticket),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Route menu ke halaman data
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PlanYourTrip()),
              );
            },
          ),
          ListTile(
            title: const Text('Event Calendar'),
            leading: const Icon(Icons.travel_explore),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Calendar()),
              );
            },
          ),
          ListTile(
            title: const Text('Culture Highlights'),
            leading: const Icon(Icons.highlight),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CultureHighlightsScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Things to Do'),
            leading: const Icon(Icons.travel_explore),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ThingsToDoPage()),
              );
            },
          ),
          ListTile(
            title: const Text('FAQ'),
            leading: const Icon(Icons.question_answer),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Route menu ke halaman data
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyFaqPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Review"),
            leading: const Icon(Icons.reviews),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context);
              // Route menu ke halaman data
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyReviewPage()),
              );
            },
          )
        ],
      ),
    );
  }
}