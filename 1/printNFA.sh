g++ REtoNFA.cpp -std=c++11
./a.out $1 > temp.txt
python convertToDot.py > result.dot
dot -Tpng result.dot -o out.png
imgcat out.png
