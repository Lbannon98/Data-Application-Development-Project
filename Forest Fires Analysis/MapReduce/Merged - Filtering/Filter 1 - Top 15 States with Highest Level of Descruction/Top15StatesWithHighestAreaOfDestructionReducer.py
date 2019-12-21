#!/usr/bin/env python
import sys

myList = []
n = 15	# Number of top N records

for line in sys.stdin:
	# remove leading and trailing whitespace
	line = line.strip()
	# split data values into list
	data = line.split("\t")

	# convert attributes (currently a string) to int
	try:
		number = float(data[0])
		#area = float(data[6])

	except ValueError:
		# ignore/discard this line
		continue

        #state = data[2]

	#if area > 20.0:
                # add (state, number) touple to list
        myList.append( (number,line) )
	# sort list in reverse order
	#myList.sort(reverse=True)

	# keep only first N records
	if len(myList) > n:
		myList = myList[:n]

# Print top N records
for (k,v) in myList:
	#print(k,v)
        print(v)
        #print('%s\t%s' % (v.split(",")[0],k))
