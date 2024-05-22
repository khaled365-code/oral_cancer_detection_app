part of 'contact_us_bloc_cubit.dart';

@immutable
sealed class ContactUsBlocState {}

final class ContactUsBlocInitial extends ContactUsBlocState {}

final class ContactUsContainerShapeChangedState extends ContactUsBlocState {}

