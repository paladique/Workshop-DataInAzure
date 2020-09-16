CREATE DATABASE weather;
USE weather;
CREATE TABLE surfaceLevelWeather (
    id serial PRIMARY KEY, 
    time DATETIME, 
    latitude DOUBLE,
    longitude DOUBLE,
    elevation DOUBLE,
    station VARCHAR(100),
    temperature DOUBLE,
    windSpeed DOUBLE,
    windAngle INT,
    currentWeatherCode INT,
    currentWeather VARCHAR(50)
);