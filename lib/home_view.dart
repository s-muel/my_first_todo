import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app1/create_todo_view.dart';

import 'create_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 243, 243, 1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1637361890611-69854d19360e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
          )),
          title: const Text(
            "My Task",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Icon(Icons.filter_list, color: Colors.black),
            Icon(Icons.search, color: Colors.black),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            TodoWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CreateToDo();
          }));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        // This is the card at the bottom of the home page showing
        // the completed task and the number of completed task
        child: InkWell(
          onTap: () {
            // this is the bottom sheet that displays our completed task
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: [CreateToDo(), CreateToDo(), CreateToDo()  ],
                  );
                });
          },
          child: Card(
            color: const Color.fromRGBO(220, 229, 238, 1),
            // color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: const [
                  Icon(Icons.check_circle),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Completed"),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(Icons.arrow_drop_down),
                  Spacer(),
                  Text("24")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: const Icon(
            Icons.check_circle_outline,
            color: Colors.pink,
          ),
          title: const Text("Plan the trip to Finland"),
          subtitle: const Text(
            "We'd like to directly mention certain contributors (in alphabetical order) for their continued community",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.notifications,
                color: Colors.pink,
              ),
              Text(
                "Yestreday",
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
