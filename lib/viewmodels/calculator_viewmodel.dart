import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorViewModel extends ChangeNotifier {
  List<String> _listHistory = [];
  List<String> get listHistory => _listHistory;

  String _text = '0';
  String get text => _text;
  String get calculation => evaluateExpression(_text);

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Obtener la lista existente de SharedPreferences
    List<String>? existingList = prefs.getStringList('myList');

    // Crear una nueva lista si no existe una lista previa
    _listHistory = existingList ?? [];
    notifyListeners();
  }

  void getHistory(int index) {
    _text = _listHistory[index];
    notifyListeners();
  }

  /// Appends the given [value] to the text field.
  void fillTextField(String value) {
    List<String> characters = _text.split('');

    if (characters.length == 1 && characters[0] == '0') {
      if (value == '.') {
        _text = '0$value';
      } else {
        _text = value;
      }
    } else if (value == '.') {
      if (_text.endsWith(" + ") ||
          _text.endsWith(" - ") ||
          _text.endsWith(" / ") ||
          _text.endsWith(" % ") ||
          _text.endsWith(" x ")) {
        _text = '${_text}0$value';
      } else {
        _text = _text + value;
      }
    } else if (_text.endsWith(" + ") ||
        _text.endsWith(" - ") ||
        _text.endsWith(" / ") ||
        _text.endsWith(" % ") ||
        _text.endsWith(" x ")) {
      if (value.contains(" + ") ||
          value.contains(" - ") ||
          value.contains(" / ") ||
          value.contains(" % ") ||
          value.contains(" x ")) {
        // Do nothing
      } else {
        _text = _text + value;
      }
    } else {
      // Check if the last number is a decimal
      bool lastNumberIsDecimal = _text.contains('.') &&
          _text.lastIndexOf(' ') < _text.lastIndexOf('.');

      if (value == '.' && lastNumberIsDecimal) {
        // The last number is already a decimal, another decimal is not allowed
        notifyListeners();
        return;
      }

      _text = _text + value;
    }

    notifyListeners();
  }

  /// Clears the text field.
  void clearAll() {
    _text = '0';
    notifyListeners();
  }

  /// Evaluates the given expression and returns the result as a string.
  String evaluateExpression(String expression) {
    try {
      if (expression.endsWith(" + ") ||
          expression.endsWith(" - ") ||
          expression.endsWith(" / ") ||
          expression.endsWith(" % ") ||
          expression.endsWith(" x ") ||
          expression.endsWith(".")) {
        // Get the position of the last operator
        int lastIndex = expression.lastIndexOf(RegExp(r'\+|-|/|%|\x|\.'));

        // Get the subexpression from the start to the last operator
        String subexpression = expression.substring(0, lastIndex);

        // Evaluate the subexpression using the evaluateExpression method recursively
        return evaluateExpression(subexpression);
      }

      expression = expression.replaceAll(
          ' ', ''); // Remove any additional white spaces from the expression

      // Evaluate multiplication and division operations
      expression =
          evaluateOperations(expression, RegExp(r'\d+(\.\d+)?[x/]\d+(\.\d+)?'));

      // Evaluate modulo operation
      expression =
          evaluateOperations(expression, RegExp(r'\d+(\.\d+)?[%]\d+(\.\d+)?'));

      // Evaluate addition and subtraction operations
      expression = evaluateOperations(
          expression, RegExp(r'\d+(\.\d+)?[+\-]\d+(\.\d+)?'));

      double result = double.parse(expression);

      // Convert the result to a string and return it
      int resultInteger = result.toInt();
      if (result == resultInteger.toDouble()) {
        return resultInteger.toString();
      } else {
        return result.toString();
      }
    } catch (e) {
      // Handle any errors that occur during evaluation
      return "Error evaluating expression";
    }
  }

  /// Evaluates the operations in the expression that match the given [regex] and replaces them with the result.
  String evaluateOperations(String expression, RegExp regex) {
    Match? match = regex.firstMatch(expression);
    while (match != null) {
      String operation = match.group(0)!;
      double result = performOperation(operation);
      String resultString = result.toString();

      // Check if the result has a sign at the beginning
      if (resultString.startsWith('-') || resultString.startsWith('+')) {
        resultString = resultString.substring(1); // Omit the first character
      }

      expression = expression.replaceFirst(operation, resultString);
      match = regex.firstMatch(expression);
    }
    return expression;
  }

  /// Performs the arithmetic operation specified by the given [operation] and returns the result.
  double performOperation(String operation) {
    List<String> elements = operation.split(RegExp(r'[x/%+-]'));
    double operand1 = double.parse(elements[0]);
    double operand2 = double.parse(elements[1]);
    String operator = operation[elements[0].length];

    if (operator == 'x') {
      return operand1 * operand2;
    } else if (operator == '/') {
      return operand1 / operand2;
    } else if (operator == '%') {
      return operand1 % operand2;
    } else if (operator == '+') {
      return operand1 + operand2;
    } else if (operator == '-') {
      return operand1 - operand2;
    } else {
      throw Exception('Invalid operator: $operator');
    }
  }

  /// Saves the result by adding it to the existing list in SharedPreferences.
  ///
  /// This method retrieves the existing list from SharedPreferences, adds the current
  /// result [_text] to the list, and then saves the updated list back to SharedPreferences.
  /// Finally, it updates the [_text] with the calculated result and notifies the listeners.
  void saveResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the existing list from SharedPreferences
    List<String>? existingList = prefs.getStringList('myList');

    // Create a new list if no previous list exists
    List<String> updatedList = existingList ?? [];

    // Add the new element to the list
    updatedList.add(_text);

    // Save the updated list to SharedPreferences
    await prefs.setStringList('myList', updatedList);

    _text = calculation; // Update the _text with the calculated result
    notifyListeners();
  }
}
