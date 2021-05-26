

inlets = 1;
outlets = 2;

sizes = [0, 0, 0, 0, 0, 0, 0, 0, 0];

function list(){

  var inc_list = arrayfromargs(arguments);

  sizes[inc_list[0]-1] += inc_list[1];

}

function bang(){
  outlet(0, sizes);
  sizes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
}
