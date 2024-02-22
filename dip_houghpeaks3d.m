%Iris Eting 209027333
%Nadav Orenstein 312349509

function peaks = dip_houghpeaks3d(H)
    peaks = zeros(5,3);
    for i = 1: 5
            [ val , idx ] = max(H( : )); 
            [ idx1 , idx2 , idx3 ] = ind2sub ( size(H), idx ) ;
            peaks(i, : ) = [ idx1 , idx2 , idx3 ] ;
            H(idx1 , idx2 , idx3 ) = 0;
    end
end