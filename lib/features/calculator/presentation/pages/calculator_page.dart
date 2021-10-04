import 'package:coding_challenge/core/injection/injection.dart';
import 'package:coding_challenge/features/calculator/presentation/cubit/calculator_cubit.dart';
import 'package:coding_challenge/features/calculator/presentation/widgets/button.dart';
import 'package:coding_challenge/features/calculator/presentation/widgets/result_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorCubit>(
      create: (_) => locator<CalculatorCubit>(),
      child: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                String value;
                if (state.input.isEmpty) {
                  value = '0';
                } else {
                  value = state.input;
                }

                return ResultDisplay(
                  text: value,
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _getButton(text: '7', onTap: () => _formulaPressed('7')),
                _getButton(text: '8', onTap: () => _formulaPressed('8')),
                _getButton(text: '9', onTap: () => _formulaPressed('9')),
                _getButton(
                    text: 'x',
                    onTap: () => _formulaPressed('*'),
                    backgroundColor: Colors.orange),
              ],
            ),
            Row(
              children: [
                _getButton(text: '4', onTap: () => _formulaPressed('4')),
                _getButton(text: '5', onTap: () => _formulaPressed('5')),
                _getButton(text: '6', onTap: () => _formulaPressed('6')),
                _getButton(
                    text: '/',
                    onTap: () => _formulaPressed('/'),
                    backgroundColor: Colors.orange),
              ],
            ),
            Row(
              children: [
                _getButton(text: '1', onTap: () => _formulaPressed('1')),
                _getButton(text: '2', onTap: () => _formulaPressed('2')),
                _getButton(text: '3', onTap: () => _formulaPressed('3')),
                _getButton(
                    text: '+',
                    onTap: () => _formulaPressed('+'),
                    backgroundColor: Colors.orange)
              ],
            ),
            Row(
              children: [
                _getButton(
                    text: '(',
                    onTap: () => _formulaPressed('('),
                    backgroundColor: Colors.grey.shade700),
                _getButton(text: '0', onTap: () => _formulaPressed('0')),
                _getButton(
                    text: ')',
                    onTap: () => _formulaPressed(')'),
                    backgroundColor: Colors.grey.shade700),
                _getButton(
                    text: '-',
                    onTap: () => _formulaPressed('-'),
                    backgroundColor: Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _getButton(
                    text: '.',
                    onTap: () => _formulaPressed('.'),
                    backgroundColor: Colors.grey.shade700),
                _getButton(
                    text: 'CE',
                    onTap: _trim,
                    backgroundColor: Colors.grey.shade700),
                _getButton(
                    text: 'C',
                    onTap: _clear,
                    backgroundColor: Colors.grey.shade700),
                _getButton(
                    text: '=',
                    onTap: _calculateResult,
                    backgroundColor: Colors.orange,
                    textColor: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getButton(
      {String? text,
      Function()? onTap,
      Color backgroundColor = Colors.grey,
      Color textColor = Colors.white}) {
    return CalculatorButton(
      label: text!,
      onTap: onTap,
      size: MediaQuery.of(context).size.width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }

  void _formulaPressed(String value) {
    context.read<CalculatorCubit>().updateValue(value);
  }

  void _calculateResult() {
    context.read<CalculatorCubit>().calculate();
  }

  void _trim() {
    context.read<CalculatorCubit>().trimValue();
  }

  void _clear() {
    context.read<CalculatorCubit>().clearValue();
  }
}
