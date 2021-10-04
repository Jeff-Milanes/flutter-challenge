part of 'calculator_cubit.dart';

class CalculatorState {
  const CalculatorState({
    this.input = '',
    this.clear = true,
  });

  final String input;
  final bool clear;

  CalculatorState copyWith({
    String? input,
    bool? clear,
  }) {
    return CalculatorState(
        input: input ?? this.input, clear: clear ?? this.clear);
  }
}
