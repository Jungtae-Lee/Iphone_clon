import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/item.dart';
import 'package:bloc/bloc.dart';

enum TodoEventType { add, remove }

class TodoEvent {
  final TodoEventType type;
  final Item item;

  TodoEvent(this.type, this.item);
}

class TodoBloc extends Bloc<TodoEvent, List<Item>> {
  TodoBloc() : super([]);

  @override
  Stream<List<Item>> mapEventToState(TodoEvent event) async* {
    switch (event.type) {
      case TodoEventType.add:
        state.add(event.item);
        break;
      case TodoEventType.remove:
        state.remove(event.item);
        break;
    }
    yield state;
  }
}
