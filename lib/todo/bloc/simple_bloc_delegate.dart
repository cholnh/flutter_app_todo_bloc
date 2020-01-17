import 'package:bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('bloc: ${bloc.runtimeType} (&${bloc.hashCode}), event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('bloc: ${bloc.runtimeType} (&${bloc.hashCode}), transition: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('bloc: ${bloc.runtimeType} (&${bloc.hashCode}), error: $error');
  }
}