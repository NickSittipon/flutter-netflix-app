import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/domain/movie/usecase/get_movie_trailer.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super (TrailerLoading());


  void getMovieTrailer(int movieId) async {

    var returnedData = await sl<GetMovieTrailerUseCase>().call(
      params:movieId
    );

    returnedData.fold(
      (error) {
        emit(FailuerLoadTrailer(errorMessage: error ));
      },
      (data) async{
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
    
        emit(TrailerLoaded(youtubePlayerController: controller ));
      }
    );
  }
}