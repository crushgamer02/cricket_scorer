import 'package:flutter/material.dart';

void main() {
  runApp(const CricketScorerApp());
}

class CricketScorerApp extends StatelessWidget {
  const CricketScorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket Scorer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScorePage(),
    );
  }
}

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int runs = 0;
  int wickets = 0;
  int overs = 0;

  void addRun(int run) {
    setState(() {
      runs += run;
    });
  }

  void addWicket() {
    setState(() {
      wickets++;
    });
  }

  void addOver() {
    setState(() {
      overs++;
    });
  }

  void resetScore() {
    setState(() {
      runs = 0;
      wickets = 0;
      overs = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cricket Scorer'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Runs: $runs", style: const TextStyle(fontSize: 24)),
          Text("Wickets: $wickets", style: const TextStyle(fontSize: 24)),
          Text("Overs: $overs", style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(onPressed: () => addRun(1), child: const Text("1 Run")),
              ElevatedButton(onPressed: () => addRun(4), child: const Text("4 Runs")),
              ElevatedButton(onPressed: () => addRun(6), child: const Text("6 Runs")),
              ElevatedButton(onPressed: addWicket, child: const Text("Wicket")),
              ElevatedButton(onPressed: addOver, child: const Text("Over")),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetScore,
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }
}
