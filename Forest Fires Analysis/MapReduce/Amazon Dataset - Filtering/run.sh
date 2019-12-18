
#
cat input/split_1.txt
cat input/split_2.txt

cat input/split_1.txt | python Top10ForestFiresByMonthAndYearMapper.py > output/Top10ForestFiresByMonthAndYearMapper_output.txt
cat input/split_2.txt | python Top10ForestFiresByMonthAndYearMapper.py >> output/Top10ForestFiresByMonthAndYearMapper_output.txt

cat output/Top10ForestFiresByMonthAndYearMapper_output.txt | python Top10ForestFiresByMonthAndYearReducer.py | sort

cat output/Top10ForestFiresByMonthAndYearMapper_output.txt | python Top10ForestFiresByMonthAndYearReducer.py | sort > output/Top10ForestFiresByMonthAndYearReducer_output.txt
read -p "Press [enter] to continue..."
