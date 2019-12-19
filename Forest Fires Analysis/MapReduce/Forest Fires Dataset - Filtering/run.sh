cat input/split_1.txt
cat input/split_2.txt

cat input/split_1.txt | python Top10MostDestructiveFiresByMonthMapper.py > output/Top10MostDestructiveFiresByMonthMapper_output.txt
cat input/split_2.txt | python Top10MostDestructiveFiresByMonthMapper.py >> output/Top10MostDestructiveFiresByMonthMapper_output.txt

cat output/Top10MostDestructiveFiresByMonthMapper_output.txt | python Top10MostDestructiveFiresByMonthReducer.py | sort

cat output/Top10MostDestructiveFiresByMonthMapper_output.txt | python Top10MostDestructiveFiresByMonthReducer.py | sort > output/Top10MostDestructiveFiresByMonthReducer_output.txt
read -p "Press [enter] to continue..."
