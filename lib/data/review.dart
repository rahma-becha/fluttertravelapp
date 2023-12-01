import 'dart:math';

import 'package:faker/faker.dart';
import 'package:projetmobilev2/data/user.dart';
import 'package:projetmobilev2/models/Review.dart';

final faker = new Faker();
List<Review> reviewList = [
  new Review(
      review: faker.lorem.sentence(),
      rating: new Random().nextInt(5) + 1,
      user: user),
  new Review(
      review: faker.lorem.sentence(),
      rating: new Random().nextInt(5) + 1,
      user: user),
  new Review(
      review: faker.lorem.sentence(),
      rating: new Random().nextInt(5) + 1,
      user: user),
  new Review(
      review: faker.lorem.sentence(),
      rating: new Random().nextInt(5) + 1,
      user: user),
  new Review(
      review: faker.lorem.sentence(),
      rating: new Random().nextInt(5) + 1,
      user: user)
];
