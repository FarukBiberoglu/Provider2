import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled42/proSınıfı.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TO DO APP',
          style: TextStyle(
              fontSize: 25,
              color: Colors.pink,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Görev Giriniz',
                      hintStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 20
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.pink),
                  onPressed: () {
                    final taskText = controller.text.trim();
                    if (taskText.isNotEmpty) {
                      context.read<TaskProvider>().addTask(taskText);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Consumer<TaskProvider>(
              builder: (context, providerModel, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: providerModel.tasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 10),
                        elevation: 5,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          title: Text(
                            providerModel.tasks[index].taskName,
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<TaskProvider>().removeTask(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
