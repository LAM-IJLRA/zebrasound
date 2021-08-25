inlets = 1;
outlets = 2;
var tools = new Object.create(null);
var k = 0.;
var sigma = [];
var threshes = [];
var out = [];

include("toolSet.js", tools);

function comp_thresh(){
  threshes = new Array(sigma.length);
  for (var ind = 0; (ind < sigma.length); ind++){
    threshes[ind] = k*sigma[ind];
  };
};

function k_threshold(new_k) {
  k = new_k;
  comp_thresh();
}

function std_div_vector(){
  var inc_list = arrayfromargs(arguments);
  tools.copy_vector(sigma, inc_list);
  comp_thresh();
};

function mean_vector() {
  var inc_list = arrayfromargs(arguments);
  tools.copy_vector(means, inc_list);
  comp_thresh();
};

function list(){
  var inc_list = arrayfromargs(arguments);
  for (var ind = 0; ind < inc_list.length; ind ++){
    if (inc_list[ind] < threshes[ind]){
      out[ind] = 0;
    }
    else {
      out[ind] = inc_list[ind];
    };
  };
  outlet(0, out);
  out = [];
}


function bang(){
  outlet(1, threshes);
}
