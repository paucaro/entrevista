import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:entrevista_ff/src/bloc/database_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/db_repository.dart';
import 'package:meta/meta.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc({@required DataBaseRespository dataBaseRespository}):
    assert(dataBaseRespository != null),
    _dataBaseRespository = dataBaseRespository;

  final DataBaseRespository _dataBaseRespository;

  @override
  DatabaseState get initialState => DatabaseLoading();

  @override
  Stream<DatabaseState> mapEventToState(DatabaseEvent event) async* {
    if(event is LoadDatabase){
      yield* _mapLoadDatabaseToState();
    }
  }

  Stream<DatabaseState> _mapLoadDatabaseToState() async* {
    yield DatabaseLoading();
    try{
      final listComp = await _dataBaseRespository.getCompetencias().first;
      yield DatabaseLoaded(listComp);
    } catch(_) {
      yield DatabaseNotLoaded();
    }
    
  }
}