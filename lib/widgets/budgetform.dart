import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/ex_category.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({Key? key}) : super(key: key);

  @override
  _BudgetFormState createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  String _category = 'Auto and Transport';
  double _amount = 0.0;
  final List<String> _categoryOptions = [
    'Auto and Transport',
    'Sports',
    'Food and Drinks',
    'Entertainment',
    'Education',
    'Other',
  ];

  // void _saveForm() async {
  //   final isValid = _formKey.currentState?.validate() ?? false;
  //   if (!isValid) {
  //     return;
  //   }
  //
  //   _formKey.currentState?.save();
  //
  //   final databaseProvider = DatabaseProvider.dbProvider;
  //
  //   // Save budget category-wise
  //   final category = ExpenseCategory(
  //     title: _category,
  //     budget: _amount,
  //     entries: 0,
  //     totalAmount: 0.0,
  //     icon: Icons.category,
  //   );
  //
  //   final result = await databaseProvider.saveBudget(category);
  //
  //   if (result != 0) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Budget saved successfully!')),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to save budget!')),
  //     );
  //   }
  //
  //   Navigator.of(context).pop();
  // }
  void _saveForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    // Save budget category-wise
    switch (_category) {
      case 'Auto and Transport':
      // TODO: Save budget for Auto and Transport category using _amount
        break;
      case 'Sports':
      // TODO: Save budget for Sports category using _amount
        break;
      case 'Food and Drinks':
      // TODO: Save budget for Food and Drinks category using _amount
        break;
      case 'Entertainment':
      // TODO: Save budget for Entertainment category using _amount
        break;
      case 'Education':
      // TODO: Save budget for Education category using _amount
        break;
      case 'Other':
      // TODO: Save budget for Other category using _amount
        break;
      default:
      // This should not happen, but just in case
        throw Exception('Invalid category: $_category');
    }

    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Set Budget Category-wise',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Category',
                  ),
                  value: _category,
                  onChanged: (value) {
                    setState(() {
                      _category = value ?? '';
                    });
                  },
                  items: _categoryOptions
                      .map((category) => DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value!) == null) {
                      return 'Please enter a valid amount';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Please enter a positive amount';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _amount = double.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
