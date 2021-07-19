function CorrMatrix = GCaMPLinReg(mat)
    %% Setup Parralel computing environemnt
    disp('Setting up processing environment');
%{
    poolWorkers = 4;

    if matlabpool('size') > 0
        matlabpool('close');
    end;
    matlabpool(poolWorkers);
%}
    clc
    masterClock = tic;
    
  
    input = mat(:,1:end);
    %% Corrolation Matrix Computation
    disp(' ')
    disp('Begin computing Corrolation Matrix')

    [LengthOfTraces NumberOfTraces] = size(input);
   
    CorrCoefs = [];
    CorrMat = [];

    for i = 1:NumberOfTraces
        for j=1:NumberOfTraces
            ref = input(:,i);
            sample = input(:,j);
            cc=corrcoef(sample,ref); 
            ccc=cc(1,2);
            CorrCoefs = [CorrCoefs ccc];
        end
        CorrMat = [CorrMat CorrCoefs];
        CorrCoefs = [];
       
    end

    M = CorrMat;
    ModuloNumber = length(M)/NumberOfTraces;
    M_prime = reshape(M,NumberOfTraces,ModuloNumber);
    inds=find(isnan(M_prime));
    M_prime(inds) = 0;
    CorrMatrix = M_prime;

    clear M_prime CorrCoefs CorrMat LengthOfTraces ...
        M cc ccc i inds j masterClock ref sample timeArray ...
        TimeChoice TimeChoice_num ModuloNumber poolWorkers NumberOfTraces
    clc

    %% Clustering algorithm
    %  Still working on this - ERDubou? 5.7.2014
    %% Close Parallel Computing Environemtn
    
    % matlabpool('close');
    
    %% Show Resulting Corrolation matrix
    imagesc(CorrMatrix);
    colormap('jet');
    caxis([0 1]);
    colorbar
end
    
    

    
    

