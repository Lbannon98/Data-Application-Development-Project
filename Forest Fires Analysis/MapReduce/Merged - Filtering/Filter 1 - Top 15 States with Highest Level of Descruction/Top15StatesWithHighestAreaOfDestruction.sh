
cat input/sample.txt

cat input/sample.txt | python Top15StatesWithHighestAreaOfDestructionMapper.py > output/Top15StatesWithHighestAreaOfDestructionMapper_output.txt

cat output/Top15StatesWithHighestAreaOfDestructionMapper_output.txt | python Top15StatesWithHighestAreaOfDestructionReducer.py

cat output/Top15StatesWithHighestAreaOfDestructionMapper_output.txt | python Top15StatesWithHighestAreaOfDestructionReducer.py > output/Top15StatesWithHighestAreaOfDestructionReducer_output.txt
read -p "Press [enter] to continue..."
