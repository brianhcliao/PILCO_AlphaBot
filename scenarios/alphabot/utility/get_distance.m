function distance = get_distance(mypi)
    distance_string = system(mypi, 'python get_distance.py');
    distance_string = strip(distance_string);
    distance = str2double(distance_string);
end