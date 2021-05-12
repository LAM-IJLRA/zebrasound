inlets = 9;
outlets = 9;

function msg_int(inc){
  for (n_inlet=0; n_inlet < 9; n_inlet++){
    if (inlet == n_inlet){
      for (var ind=0; ind<9; ind++){
        if (ind != n_inlet){outlet(ind, "bang");};
      };
    };
  };
};
