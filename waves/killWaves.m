%%% killWaves.m 
%%% Daniel Fernández
%%% July 2015
%%% Removes wave forces in the water column.  Used for tuning controller
%%% gains or just playing god.


function [ spectra ] = killWaves( t, spectra, count, qualifier )

if count ~= qualifier
    return
    
else
    spectra.d = 50;
    spectra.T = 10000;
    spectra.H = .000001;
    spectra.E = 0;
    spectra.theta = 0;
    spectra.rho = 1030;

    iterations = numel(t) - count + 1;
    iterations( iterations ==  numel(t)) = numel(t) - 1;
    spectra.eta(end-iterations:end) = 0;

    [ spectra.w, spectra.L, spectra.k ] = dispersion( spectra.d, spectra.T, 9.81 );
    
end