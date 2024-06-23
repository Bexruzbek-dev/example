import 'package:example/model_http_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    modelHttpService.addUser();
  }

  final modelHttpService = ModelHttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return FutureBuilder(
            future: modelHttpService.getExamples(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {}
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("Foydalanuvchilar mavjud emas"),
                );
              }

              final users = snapshot.data!;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network(users[index].imageUrl),
                      ),
                      title: Text(users[index].name),
                    );
                  });
            });
      }),
    );
  }
}
