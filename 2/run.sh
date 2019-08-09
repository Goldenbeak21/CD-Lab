#pip install imgcat
#sudo apt-get install graphviz || brew install graphviz
g++ REtoNFA.cpp jsoncpp.cpp -std=c++11 -o REtoNFA
./REtoNFA
