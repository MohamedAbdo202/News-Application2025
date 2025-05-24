abstract class NewsStates {}

class InitialState extends NewsStates {}

class GetNewsSuccess extends NewsStates {}

class GetNewsLoading extends NewsStates {}

class GetNewsFailure extends NewsStates {
  GetNewsFailure({required this.errorMessage});

  final String errorMessage;
}

class GetNewsSearchSuccess extends NewsStates {}

class GetNewsSearchLoading extends NewsStates {}

class GetNewsSearchEmpty extends NewsStates {}

class GetNewsSearchFailure extends NewsStates {
  GetNewsSearchFailure({required this.errorMessage});

  final String errorMessage;
}
