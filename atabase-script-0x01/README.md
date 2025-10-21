# Airbnb Clone – Database Schema

## Overview

This schema is designed for the backend of an Airbnb-like platform. It includes tables for users, places, cities, states, reviews, and amenities.

## Tables and Relationships

- **users**: stores user information.
- **states**: list of states (e.g., California).
- **cities**: each belongs to a state.
- **places**: listed by a user, located in a city.
- **reviews**: written by users about places.
- **amenities**: list of features (e.g., WiFi).
- **place_amenity**: many-to-many relation between places and amenities.

## Relationships

- `cities.state_id` → references `states.id`
- `places.user_id` → references `users.id`
- `places.city_id` → references `cities.id`
- `reviews.user_id` → references `users.id`
- `reviews.place_id` → references `places.id`
- `place_amenity` → links `places` and `amenities` in a many-to-many relationship.

## Constraints and Indexes

- All primary keys are `AUTO_INCREMENT` integers.
- Foreign keys enforce referential integrity.
- Indexes created on `city_id`, `place_id` for performance.
- Unique constraint on `users.email`.

## Notes

- Timestamps are used to track creation time (`created_at`).
- The schema follows 3rd Normal Form (3NF).
