// threshold based on standard deviation

inlets = 1;
outlets = 2;
var sigma = [];
var means = [];
var thresh = [];
var out_vector = [];
var k = 1.;

function copy_vector(target, vector) {
  for (var ind = 0; ind < vector.length; ind ++){
    target[ind] = vector[ind];
  };
};

function comp_thresh(){
  thresh = copy_vector(thresh, sigma);
  for (var ind = 0; (ind < sigma.length) & (ind < means.length); ind++){
    thresh[ind] = k*sigma[ind];
  };
};

function apply_thresh(vector){
  for (var ind = 0; (ind < vector.length) & (ind < thresh.length); ind++){
    if (vector[ind] >= thresh[ind]){
      out_vector[ind] = vector[ind];
    }
    else out_vector[ind] = 0.;
  };
};

function msg_float(inc_float){
  k = inc_float;
  comp_thresh();
};

function std_div_vector(){
  var inc_list = arrayfromargs(arguments);
  copy_vector(sigma, inc_list);
  comp_thresh();
};

function means_vector() {
  var inc_list = arrayfromargs(arguments);
  copy_vector(means, inc_list);
  comp_thresh();
};

function bang(){
  outlet(1, thresh);

};

function list(){
  var inc_list = arrayfromargs(arguments);
  apply_thresh(inc_list);
  outlet(0, out_vector);
  out_vector = [];
}
