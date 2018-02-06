
#include <gaml-libsvm.hpp>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <utility>
#include <string>
#include <fstream>
#include <iostream>
#include <ctime>

typedef std::pair<double,double> XY;
typedef double                   Z;
typedef std::pair<XY,Z>          Data;
typedef std::vector<Data>        DataSet;

// We need a function that builds an array of svm_nodes for
// representing some input. When the input is a collection of values
// that can provide iterators, libsvm::input_of can help. Here, we
// have to write it by ourselves.


// x y are stored with 3 nodes...
int nb_nodes_of(const XY& xy) {
  return 3;
}

// ... as follows.
void fill_nodes(const XY& xy,struct svm_node* nodes) {
  nodes[0].index = 1;
  nodes[0].value = xy.first;  // x 
  nodes[1].index = 2;
  nodes[1].value = xy.second; // y
  nodes[2].index = -1;        // end
}

const XY& input_of (const Data& data) {return data.first;}
double    output_of(const Data& data) {return data.second;} // this should return a double for libsvm.

// This is gnuplots a function
#define PLOT_STEP .04
template<typename Func>
void gnuplot(std::string filename,
	     std::string title,
	     const Func& f) {
  XY x;
  std::ofstream file;

  file.open(filename.c_str());
  if(!file) {
    std::cerr << "Cannot open \"" << filename << "\"." << std::endl;
    return;
  }

  file << "set hidden3d" << std::endl
       << "set title \"" << title << "\"" << std::endl
       << "set view 41,45" << std::endl
       << "set xlabel \"x\"" << std::endl
       << "set ylabel \"y\"" << std::endl
       << "set zlabel \"z\"" << std::endl
       << "set ticslevel 0" << std::endl
       << "splot '-' using 1:2:3 with lines notitle" << std::endl;

  for(x.first=-1;x.first<=1;x.first+=PLOT_STEP,file << std::endl)
    for(x.second=-1;x.second<=1;x.second+=PLOT_STEP,file << std::endl)
      file << x.first << ' ' << x.second << ' ' << f(x);

  file.close();
  std::cout << "Gnuplot file \"" << filename << "\" generated." << std::endl;
}

int main(int argc, char* argv[]) {

  // Let us make libsvm quiet
  gaml::libsvm::quiet();
  // random seed initialization
  std::srand(std::time(0));

  
  try {

    // Let us collect samples.
    
    DataSet basisX;
    DataSet basisY;
    XY panTiltTemp;
    Z x;
    Z y;
    Data dataTempX;
    Data dataTempY;    
    std::ifstream fileIn(argv[1]); //use an absolute path
    std::string line;
    
    while (std::getline(fileIn, line)){
	char* temp;
	temp =  strtok((char*)line.c_str()," ");
	panTiltTemp.first = ((std::stof(temp)+180)/180)-1;
	temp =  strtok(NULL," ");
	panTiltTemp.second = ((std::stof(temp)+90)/45)-1;
	temp =  strtok(NULL," ");
	x = std::stof(temp);
	temp =  strtok(NULL," ");
	y = std::stof(temp);

	dataTempX.first = panTiltTemp;
	dataTempX.second = x;
	basisX.push_back(dataTempX);
	
	dataTempY.first = panTiltTemp;
	dataTempY.second = y;
	basisY.push_back(dataTempY);
    }

    // we resize the data

    

    
    // Let us set configure a svm

    struct svm_parameter params;
    gaml::libsvm::init(params);
    params.kernel_type = RBF;          // RBF kernel
    params.gamma       = 10;           // k(u,v) = exp(-gamma*(u-v)^2)
    params.svm_type    = EPSILON_SVR;
    params.p           = .05;          // epsilon
    params.C           = 10;
    params.eps         = 1e-3;         // numerical tolerence

    // This sets up a svm learning algorithm.
    auto learner = gaml::libsvm::supervized::learner<XY,Z>(params, nb_nodes_of, fill_nodes);

    // Let us train it and get some predictor f. f is a function, as the oracle.
    std::cout << "Learning..." << std::endl;
    auto fX = learner(basisX.begin(),basisX.end(),input_of,output_of);
    auto fY = learner(basisY.begin(),basisY.end(),input_of,output_of);

    // Let us plot the result.
    gnuplot("predictionX.plot","SVM prediction",fX);
    gnuplot("predictionY.plot","SVM prediction",fY);

    // All libsvm functions related to svm models are implemented.
    std::cout << std::endl
    	      << "There are " << fX.get_nr_sv() << " support vectors for SVM-X and "<<fX.get_nr_sv()<<" for SVM-Y."  << std::endl;

    // We can compute the empirical risk with gaml tools.
    auto evaluator = gaml::risk::empirical(gaml::loss::Quadratic<double>());
    double riskX    = evaluator(fX, basisX.begin(), basisX.end(), input_of, output_of);
    double riskY    = evaluator(fY, basisY.begin(), basisY.end(), input_of, output_of);

    std::cout << "Empirical quadratic risk for X: " << riskX << std::endl
    	      << "               i.e error : " << sqrt(riskX) << std::endl
	      << "Empirical quadratic risk for Y: " << riskY << std::endl
    	      << "               i.e error : " << sqrt(riskY) << std::endl;
    
    // Let us use a cross-validation procedure
    auto kfold_evaluator = gaml::risk::cross_validation(gaml::loss::Quadratic<double>(),
							gaml::partition::kfold(10), true);
    riskX                 = kfold_evaluator(learner, basisX.begin(), basisX.end(), input_of, output_of);
    riskY                 = kfold_evaluator(learner, basisY.begin(), basisY.end(), input_of, output_of);

    std::cout << "Real quadratic risk X estimation : " << riskX << std::endl
    	      << "                     i.e error : " << sqrt(riskX) << std::endl
	      << "Real quadratic risk Y estimation : " << riskY << std::endl
    	      << "                     i.e error : " << sqrt(riskY) << std::endl;


    // Now, let us save our predictor.
    fX.save_model("fX.pred");
    fY.save_model("fY.pred");

    // We can load it and use it on another databasis. The newly
    // created predictor (from scratch) predictor must be provided
    // with the required conversion functions.
    
    gaml::libsvm::Predictor<XY,Z> gX(nb_nodes_of, fill_nodes);
    gX.load_model("fX.pred");

    riskX = evaluator(gX, basisX.begin(), basisX.end(), input_of, output_of);
    std::cout << "Empirical X risk (loaded predictor) : " << riskX << std::endl
    	      << "                        i.e error : " << sqrt(riskX) << std::endl;
    gnuplot("prediction-loadedX.plot","SVM-X  prediction",gX);
  }
  catch(gaml::exception::Any& e) {
    std::cout << e.what() << std::endl;
  }
  
  return 0;
}
