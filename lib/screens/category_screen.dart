
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:jupiter_clone/screens/settings_screen.dart';
import '../widgets/budgetform.dart';
import '../widgets/category_screen/category_fetcher.dart';
import '../widgets/expense_form.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const name = '/category_screen'; // for routes

  triggerNotification(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(id: 10,
            channelKey: 'basic_channel',
            title: 'Budget Notification',
            body: 'Your Budget is exceeded',
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Expense Tracker'),
        backgroundColor: Colors.red[400],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Add your settings action here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: const CategoryFetcher(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => const ExpenseForm(),
              );
            },
            backgroundColor: Colors.red[400],
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => const BudgetForm(),
              );
              //triggerNotification();
            },
            backgroundColor: Colors.green[400],
            child: const Icon(Icons.monetization_on),
          ),
        ],
      ),
    );
  }
}

