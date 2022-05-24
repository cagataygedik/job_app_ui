import 'package:flutter/material.dart';
import 'package:jobapp/utils/job_card.dart';
import 'package:jobapp/utils/recent_job.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
// [company name, jobtitle, logoimagepath, hourlyrate]
    ['Uber', 'UI Designer', 'lib/icons/uber.png', 45],
    ['Google', 'Cloud Engineer', 'lib/icons/google.png', 90],
    ['Apple', 'Swift Developer', 'lib/icons/apple.png', 85]
  ];

  final List recentJobs = [
// [company name, jobtitle, logoimagepath, hourlyrate]
    ['Nike', 'Android Developer', 'lib/icons/nike.png', '75'],
    ['Google', 'Azure Engineer', 'lib/icons/google.png', '100'],
    ['Apple', 'DevOps Engineer', 'lib/icons/apple.png', '120']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 75,
      ),
      // app bar
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200]),
          child: Image.asset(
            'lib/icons/menu.png',
            color: Colors.grey[800],
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),

      // discover your new job

      const Padding(
        padding: EdgeInsets.only(left: 25.0),
        child: Text(
          'Discover Your New Job',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),

      const SizedBox(
        height: 25,
      ),
      // search bar
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 30,
                        child: Image.asset(
                          'lib/icons/search.png',
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a job...'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(
                'lib/icons/preferences.png',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 25.0),
        child: Text(
          'For You',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      // for you -> job cards
      Container(
        height: 160,
        child: ListView.builder(
            itemCount: jobsForYou.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return JobCard(
                companyName: jobsForYou[index][0],
                jobTitle: jobsForYou[index][1],
                logoImagePath: jobsForYou[index][2],
                hourlyRate: jobsForYou[index][3],
              );
            }),
      ),
      SizedBox(
        height: 50,
      ),

// recently add -> job titles

      const Padding(
        padding: EdgeInsets.only(left: 25.0),
        child: Text(
          'Recently Added',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),

      Expanded(
        child: ListView.builder(
            itemCount: recentJobs.length,
            itemBuilder: (context, index) {
              return RecentJobCard(
                companyName: recentJobs[index][0],
                jobTitle: recentJobs[index][1],
                logoImagePath: recentJobs[index][2],
                hourlyRate: recentJobs[index][3],
              );
            }),
      )
    ]));
  }
}
