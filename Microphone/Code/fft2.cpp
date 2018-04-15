
#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <fstream>
#include <iterator>
#include <complex>
#include <fftw3.h>

using namespace std;

int main()
{

// get array of Intensities
    ifstream file("values.txt");
    vector<complex<double> > fftInput;

    double curVal;
    int i = 0;

    while(file >> curVal) {

        fftInput.push_back(complex<double>(i,curVal));
        i++;
    }
//FFT
    fftw_plan plan = fftw_plan_dft_1d( fftInput.size(), (fftw_complex*) &fftInput[0],
                                          (fftw_complex*) &fftInput[0],
                                          FFTW_FORWARD,
                                          FFTW_ESTIMATE);
    fftw_execute(plan);
    fftw_destroy_plan(plan);

    std::ofstream output_file1("./spectr.txt");
    std::ostream_iterator<complex<double> > output_iterator1(output_file1, "\n");
    std::copy(fftInput.begin(), fftInput.end(), output_iterator1);


    //for (int i=0;i<10;i++) cout<<fftInput[i]<<endl;



	return 0;

}
