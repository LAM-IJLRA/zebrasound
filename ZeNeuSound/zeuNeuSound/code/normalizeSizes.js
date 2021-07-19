

inlets = 1;
outlets = 3;

sizes = [0, 0, 0, 0, 0, 0, 0, 0, 0];

function copy_vector(target, vector) {
  for (var ind = 0; ind < vector.length; ind ++){
    target[ind] = vector[ind];
  };
};

function listSizes(){
  var inc_list = arrayfromargs(arguments);
  for (var ind = 0; ind < inc_list.length; ind ++){
    sizes[ind] = inc_list[ind];
  };
  sizes = inc_list;
  outlet(2, sizes)
}

function bang(){
  outlet(0, sizes)
}

function list(){
  var inc_list = arrayfromargs(arguments);
  var norm = sizes[inc_list[0]-1]
  outVar = inc_list[1]/norm;
  outlet(1, outVar)
}
