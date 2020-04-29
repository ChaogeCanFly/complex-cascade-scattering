function AuR = AuR(X,Y,Lambda,Zeta,SQRT,spac)

s = spac(1); d = spac(2); % Spacing
del = sqrt(s^2 + d^2);
sgn = sign(imag(Lambda(end)));

AuRNum = -sgn*Zeta.*exp(1i*sgn*s*Zeta).*cos(Zeta.*Y).*exp(-1i*Lambda.*X);
AuRDen = 2*del*sin(s*Zeta).*SQRT;

AuR = AuRNum./AuRDen;

end