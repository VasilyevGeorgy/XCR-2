#include <iostream>
#include <fstream>
#include <vector>
#include <complex>

using namespace std;

int main()
{


    ifstream file("values.txt");
    vector<complex<double> > fftInput;

    double curVal;
    int i = 0;

    while(file >> curVal) {

        fftInput.push_back(complex<double>(i,curVal));
        i++;
    }


    for (int i=0;i<10;i++) cout<<fftInput[i]<<endl;



	return 0;

}
