%\-----------------------------------------------------/
% Definition of objective and constraints for misqp
function [fx,cx]= fobj_misqp(x,neq,fobj,varargin)

global n_fun_eval ccll ccuu n_upper n_lower

c=[];

if ~isempty(ccll) | ~isempty(ccuu)
    [fx,ggg] = feval(fobj,x,varargin{:});
else
    [fx] = feval(fobj,x,varargin{:});
    ggg=[];
end
n_fun_eval = n_fun_eval + 1;


ninequ=length(n_upper);
for i=1:ninequ
    c=[c ccuu(n_upper(i))-ggg(n_upper(i))];
end

nineql=length(n_lower);
for j=1:nineql
    c=[c ggg(n_lower(j))-ccll(n_lower(j))];
end

cx=[ggg(1:neq) c];

return
%\-----------------------------------------------------/

