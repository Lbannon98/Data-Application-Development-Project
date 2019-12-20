
cat input/sample.txt

cat input/sample.txt | python Top5MonthsWithHighestTempAndNumberOfFiresMapper.py > output/Top5MonthsWithHighestTempAndNumberOfFiresMapper_output.txt

cat output/Top5MonthsWithHighestTempAndNumberOfFiresMapper_output.txt | python Top5MonthsWithHighestTempAndNumberOfFiresReducer.py | sort

cat output/Top5MonthsWithHighestTempAndNumberOfFiresMapper_output.txt | python Top5MonthsWithHighestTempAndNumberOfFiresReducer.py > output/Top5MonthsWithHighestTempAndNumberOfFiresReducer_output.txt
read -p "Press [enter] to continue..."
