import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsInitial()) {
    on<FetchProjects>(_onFetchProjects);
  }

  Future<void> _onFetchProjects(
    FetchProjects event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(ProjectsLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      // TODO: replace this with your real data fetching
      final projects = <Map<String, String>>[
        {
          'title': 'Site Web E-commerce',
          'desc': 'Refonte complète du site web e-commerce avec nouveau design',
          'date': '15 oct. 2023',
          'status': 'Actif',
        },
        {
          'title': 'Application Mobile',
          'desc': 'Développement d\'une application mobile iOS et Android',
          'date': '5 nov. 2023',
          'status': 'Terminé',
        },
        {
          'title': 'Site Librairie',
          'desc': 'Redesign d\'une librairie',
          'date': '1 jan. 2024',
          'status': 'Actif',
        },
      ];

      emit(ProjectsLoaded(projects));
    } catch (e) {
      emit(ProjectsFailure(e.toString()));
    }
  }
}
