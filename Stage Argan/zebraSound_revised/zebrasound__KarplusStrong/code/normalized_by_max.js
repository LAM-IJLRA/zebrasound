/*

simple example of reading and writing a file

*/
inlets = 1;
outlets = 1;

var max_list = new Array(0);

function list()
{
	var inc_list = arrayfromargs(arguments);
	if (max_list.length == 0){
		max_list=inc_list;
	}
	else{
		for (var ind = 0; ind < max_list.length; ind++){
			if (max_list[ind] < inc_list[ind]){
				max_list[ind] = inc_list[ind];
			}
		};
	};
};

function bang(){
	outlet(0, max_list);
};
