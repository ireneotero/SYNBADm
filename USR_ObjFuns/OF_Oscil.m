function [f,g] = OF_Oscil(vy,opstr)

oscil_xcorr_threshold = 0.01;

idx = opstr.idx;
par = opstr.par;

n_Transcripts = opstr.n_Transcripts;
n_Promoters = opstr.n_Promoters;

n_real = opstr.n_real;
n_int = opstr.n_int;

x = vy(1:n_real);
y_int = vy(n_real+1:n_real+n_int);
y_bin = vy(n_real+n_int+1:end);
y = [y_int;y_bin];

k=par.value;


for ii=1:1:size(idx,2)
    k(idx{ii})=x(ii);
end

D_max = opstr.D_max;
D_min = opstr.D_min;


Y=reshape(y,n_Promoters,n_Transcripts);
Y=Y';

eval(sprintf('states= %s(Y);',opstr.def_states));

z0=states.z0;

tspan = 0:10:40000;

parstr.y = y;
parstr.k = k;


ivpopt = odeset('RelTol',opstr.ivpsol_rtol,'AbsTol',opstr.ivpsol_atol);

if opstr.name_odefile(end)=='c'
  [t,z]=SYNBAD_CVODES(opstr.name_odefile,tspan,z0,parstr,opstr.ivpsol_rtol,opstr.ivpsol_atol,Inf);
else
  [t,z] = ode15s(odefile_f,tspan,z0,ivopt,parstr);
end


speciesnames=states.name;

trnsc = {'lacI','cIR','tetR','araC','luxI','luxR','lasR','lasI','ccdB','ccdA','ccdA2'};

counter=0;
for ii=1:1:size(trnsc,2)
    idx = strmatch(trnsc(ii),speciesnames,'exact');
    if ~isempty(idx)
        x = z(:,idx);
        if mean(x)<1e-5
            counter=counter+1;
            Zb(counter) =  -1e10;
        else
            [a,lag] = auto_correlation(x);
            pos = find(lag>0);
            
            t2=lag(pos);
            x2=a(pos);
            x2_norm=x2/x2(1);
            
            
            [maximos,minimos]=peakdet(x2_norm,oscil_xcorr_threshold);
            
            if size(minimos,1)<2;
                counter=counter+1;
                Zb(counter) =  -1e10;
            else
                counter=counter+1;
                Zb(counter) = maximos(2,2)-minimos(1,2);
               
            end
        end
        
    end
end


Z = max(Zb);

f=-Z;
g(1) = +D_max - sum(y);
g(2) = -D_min + sum(y);
end

function [maxtab, mintab]=peakdet(v, delta, x)
%PEAKDET Detect peaks in a vector
%        [MAXTAB, MINTAB] = PEAKDET(V, DELTA) finds the local
%        maxima and minima ("peaks") in the vector V.
%        MAXTAB and MINTAB consists of two columns. Column 1
%        contains indices in V, and column 2 the found values.
%
%        With [MAXTAB, MINTAB] = PEAKDET(V, DELTA, X) the indices
%        in MAXTAB and MINTAB are replaced with the corresponding
%        X-values.
%
%        A point is considered a maximum peak if it has the maximal
%        value, and was preceded (to the left) by a value lower by
%        DELTA.

% Eli Billauer, 3.4.05 (Explicitly not copyrighted).
% This function is released to the public domain; Any use is allowed.

maxtab = [];
mintab = [];

v = v(:); % Just in case this wasn't a proper vector

if nargin < 3
    x = (1:length(v))';
else
    x = x(:);
    if length(v)~= length(x)
        error('Input vectors v and x must have same length');
    end
end

if (length(delta(:)))>1
    error('Input argument DELTA must be a scalar');
end

if delta <= 0
    error('Input argument DELTA must be positive');
end

mn = Inf; mx = -Inf;
mnpos = NaN; mxpos = NaN;

lookformax = 1;

for i=1:length(v)
    this = v(i);
    if this > mx, mx = this; mxpos = x(i); end
    if this < mn, mn = this; mnpos = x(i); end

    if lookformax
        if this < mx-delta
            maxtab = [maxtab ; mxpos mx];
            mn = this; mnpos = x(i);
            lookformax = 0;
        end
    else
        if this > mn+delta
            mintab = [mintab ; mnpos mn];
            mx = this; mxpos = x(i);
            lookformax = 1;
        end
    end
end

end


function [a,lag]=auto_correlation(x)

corrLength=2*length(x)-1;

a=fftshift(ifft(fft(x,corrLength).*conj(fft(x,corrLength))));

lag=-length(x)+1:length(x)-1;

end

