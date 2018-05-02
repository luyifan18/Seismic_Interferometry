function [xgrid,ygrid,zgrid]=poly2d(coeff,order,xcoord,ycoord)
% compute a 2-D polynomial and return gridded values
%
% [xgrid,ygrid,zgrid]=poly2d(coeff,order,xcoord,ycoord)
%
% coeff =  a vector of polynomial coefficients (generated by polysurf)
% order = order of the 2D polynomial
% xcoord = row vector of x coordinates labeling the columns of the output
%         matrix
% ycoord = column vector of y coordinates labeling the rows of the output
%         matrix
% zgrid = output matrix of size (length(ycoords), length(xcoords)) containing 
%	the polynomial function values at the specified grid locations
% xgrid = output matrix of size (length(ycoords), length(xcoords)) containing 
%	the xcoordinates at the specified grid locations
% ygrid = output matrix of size (length(ycoords), length(xcoords)) containing 
%	the ycoordinates at the specified grid locations
%        
% by G.F. Margrave, March 1993
%
% NOTE: This SOFTWARE may be used by any individual or corporation for any purpose
% with the exception of re-selling or re-distributing the SOFTWARE.
% By using this software, you are agreeing to the terms detailed in this software's
% Matlab source file.

% BEGIN TERMS OF USE LICENSE
%
% This SOFTWARE is maintained by the CREWES Project at the Department
% of Geology and Geophysics of the University of Calgary, Calgary,
% Alberta, Canada.  The copyright and ownership is jointly held by
% its 'AUTHOR' (identified above) and the CREWES Project.  The CREWES
% project may be contacted via email at:  crewesinfo@crewes.org
%
% The term 'SOFTWARE' refers to the Matlab source code, translations to
% any other computer language, or object code
%
% Terms of use of this SOFTWARE
%
% 1) This SOFTWARE may be used by any individual or corporation for any purpose
%    with the exception of re-selling or re-distributing the SOFTWARE.
%
% 2) The AUTHOR and CREWES must be acknowledged in any resulting publications or
%    presentations
%
% 3) This SOFTWARE is provided "as is" with no warranty of any kind
%    either expressed or implied. CREWES makes no warranties or representation
%    as to its accuracy, completeness, or fitness for any purpose. CREWES
%    is under no obligation to provide support of any kind for this SOFTWARE.
%
% 4) CREWES periodically adds, changes, improves or updates this SOFTWARE without
%    notice. New versions will be made available at www.crewes.org .
%
% 5) Use this SOFTWARE at your own risk.
%
% END TERMS OF USE LICENSE
% generate the xgrid matrix
xgrid = ones(length(ycoord),1)*xcoord;
%generate the ygrid matrix
ygrid = ycoord*ones(1,length(xcoord));
%generate the 2-D Vandermonde matrix of order=order
numcols = sum( 1:order+1 );
V = zeros(length(xgrid(:)),numcols);
 
colcount = 1;
for n=order:-1:0
   for m=0:n
         V(:,colcount) = (xgrid(:).^(n-m)).*(ygrid(:).^m);
         colcount=colcount+1;
   end
end
% compute zgrid by matrix multiplication
zgrid = V*coeff;
zgrid = reshape(zgrid,length(ycoord),length(xcoord));
   
 
 