import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Rewards',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  RewardItem(
                    rewardName: 'tuckshop Voucher',
                    pointsRequired: 50,
                  ),
                  RewardItem(
                    rewardName: 'No Homework pass',
                    pointsRequired: 100,
                  ),
                  RewardItem(
                    rewardName: '15 minutes free time in class',
                    pointsRequired: 50,
                  ),
                  // Add more reward items here
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to add a new reward
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                  minimumSize: Size(double.infinity, 50), // Button size
                ),
                child: Text(
                  'Edit Rewards',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 16, right: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to add a new reward
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Button color
                  minimumSize: Size(double.infinity, 50), // Button size
                ),
                child: Text(
                  'Add Reward',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RewardItem extends StatelessWidget {
  final String rewardName;
  final int pointsRequired;

  RewardItem({
    required this.rewardName,
    required this.pointsRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(rewardName),
        subtitle: Text('Points Required: $pointsRequired'),
        onTap: () {
          // Add logic to handle when a reward is tapped
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RewardsPage(),
  ));
}
