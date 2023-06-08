clc
clear all

age = input('Please enter your age: ');
while (age>100 ||age <1 )
    age = input('Please enter a valid age: ');
end

gender = input('Please enter your gender.Type "1" for male and "2" for female ');
height = input('Please enter your height: ');
weight = input('Please enter your weight: ');

% Met for race walking 
met = 6.5;
total_time = input('Please enter your total time of walking in minutes: ');
calories_burned_per_minute = (met * 3.5 * weight)/200;
total_calories = calories_burned_per_minute * total_time;
disp(total_calories)
