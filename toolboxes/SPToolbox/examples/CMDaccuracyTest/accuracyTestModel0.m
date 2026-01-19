function [f,dfdphi] = DMDaccuModel1(phi)

f = [phi(1),phi(2)];

dfdphi(:,:,1) = [1,0];
dfdphi(:,:,2) = [0,1];

end