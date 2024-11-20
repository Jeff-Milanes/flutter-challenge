import 'package:bloc/bloc.dart';
import 'package:function_tree/function_tree.dart';
import 'package:injectable/injectable.dart';
import 'package:coding_challenge/core/extensions/cubit_extension.dart';

part 'calculator_state.dart';

@injectable
class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState());

  void updateValue(String value) {
    String val = value;
    if (state.clear == false) {
      val = state.input + value;
    }

    if (state.input.isNotEmpty) {
      final lastValue =
          state.input.substring(state.input.length - 1, state.input.length);

      if (value.contains('(')) {
        final joinVal = lastValue + val;
        if (joinVal.contains(RegExp(r'\d\('))) {
          val = '${state.input}*(';
        }
      }

      if (lastValue.contains(')')) {
        final joinVal = lastValue + val;
        if (joinVal.contains(RegExp(r'\(\d'))) {
          val = '${state.input}*$value';
        }
      }
    }

    safeEmit(state.copyWith(input: val, clear: false));
  }

  void clearValue() {
    safeEmit(state.copyWith(input: '', clear: true));
  }

  void trimValue() {
    if (state.input.isNotEmpty) {
      final output = state.input.substring(0, state.input.length - 1);
      safeEmit(state.copyWith(input: output, clear: output.isEmpty ? true : false));
    }
  }

  void calculate() {
    try {
      final output = state.input;
      if (output.isNotEmpty) {
        final result = output.interpret();
        safeEmit(state.copyWith(input: result.toString(), clear: true));
      }
    } catch (_) {
      safeEmit(state.copyWith(input: 'Undefined', clear: true));
    }
  }
}
