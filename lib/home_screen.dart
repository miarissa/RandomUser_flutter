import 'package:flutter/material.dart';
import 'user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? user;
  String? error;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    setState(() {
      user = null;
      error = null;
    });

    try {
      final result = await UserService.fetchRandomUser();
      setState(() {
        user = result;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load user.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: user != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      user!['picture']['large'],
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${user!['name']['first']} ${user!['name']['last']}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(user!['email']),
                    Text('${user!['location']['city']}, ${user!['location']['country']}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: loadUser,
                      child: Text('Load New User'),
                    )
                  ],
                )
              : error != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(error!,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: loadUser,
                          child: Text('Retry'),
                        )
                      ],
                    )
                  : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
