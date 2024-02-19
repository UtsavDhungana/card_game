//  T denotes return type of the remote source

import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../constants/constants.dart';
import '../error/exception.dart';
import '../error/failures.dart';
import '../network/network_info.dart';

@LazySingleton()
class ErrorHandler {
  final NetworkInfo networkInfo;
  ErrorHandler(this.networkInfo);

  Future<Either<Failure, T>> errorHandler<T>(dynamic remoteSource) async {
    log(remoteSource.toString());
    try {
      if (await networkInfo.isConnected!) {
        var data = await remoteSource;
        return Right(data as T);
      } else {
        return const Left(
          Failure(
            ErrorMessage.internetFailureMessage,
          ),
        );
      }
    } on SocketException catch (e) {
      return const Left(
        Failure(
          ErrorMessage.internetFailureMessage,
        ),
      );
    } on ServerException catch (error) {
      return Left(
        Failure(
          error.exceptionMessage,
        ),
      );
    } on CacheException catch (error) {
      return Left(
        Failure(
          error.exceptionMessage,
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      return const Left(
        Failure(
          ErrorMessage.somethingWentWrongFailureMessage,
        ),
      );
    }
  }
}
