#!/usr/bin/env python
import sys
#import date

# Mapper to return local top 10 cars by weight
# Data source: https://archive.ics.uci.edu/ml/datasets/Auto+MPG
# Data header: "mpg" "cylinders" "displacement" "horsepower" "weight" "acceleration" "model_year" "origin" "car_name"

# Initialise a list to store the top N records as a collection of touples (weight, record)

# HIGHEST NUMBER OF FOREST FIRES BY MONTH & YEAR

myList = []
n = 10	# Number of top N records

for line in sys.stdin:
	# remove leading and trailing whitespace
	line = line.strip()
	# split data values into list
	data = line.split(",")

	# convert weight (currently a string) to int
	try:
		number = int(data[4])

	except ValueError:
		# ignore/discard this line
		continue

	# add (weight, record) touple to list
	myList.append( (number, line) )cat output/Top10ForestFiresByMonthAndYearMapper_output.txt | python Top10ForestFiresByMonthAndYearReducer.py

	# sort list in reverse order
	myList.sort(reverse=True)

	# keep only first N records
	if len(myList) > n:
		myList = myList[:n]

# Print top N records
for (k,v) in myList:
	#print(k,v)
	print('%s\t%s' % (k, v))
