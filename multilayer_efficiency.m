function effi=multilayer_efficiency(so,do,N,weight)
effi=[];
NumofLink=0;
while max(weight)>0
    effi_0=0;
    so_sub=[];do_sub=[];
    for i=1:length(weight)
        if weight(i)>0
            so_sub=[so_sub so(i)];
            do_sub=[do_sub do(i)];
            weight(i)=weight(i)-1;
        end
    end
    if length(so_sub)==NumofLink
        effi_0=effi(end);
    else
        G_sub=graph(so_sub,do_sub);
        distanceMatrix=distances(G_sub);
        n=size(distanceMatrix,1);
        distance=distanceMatrix(:);
        distance(1:n+1:n*n)=[];
        effi_0=effi_0+sum(1./distance);
    end
    NumofLink=length(so_sub);
    effi=[effi effi_0];
end
effi=sum(effi)/(N*(N-1));
            
            
            
        
            
        
 