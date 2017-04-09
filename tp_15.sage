f(x) = 3*x*(1-x)

def liste_suite(f,terme_init,n):
	maliste = []
	x = terme_init
	for k in range(n):
		maliste.append(x)
		x = f(x)
	return maliste


def liste_points(f,terme_init,n):
	u = liste_suite(f,terme_init,n)
	mespoints = [ (u[0],0) ]
	for k in range(n-1):
		mespoints.append( (u[k],u[k+1]) )
		mespoints.append( (u[k+1],u[k+1]) )
	return mespoints

def dessine_suite(f,terme_init,n):
	mespoints = liste_points(f,terme_init,n)
	G = plot(f,(x,0,1), color='red') # La fonction
	G = G + plot(x,(x,0,1), color='green') # La droite (y=x)
	G = G + line(mespoints) # La suite
	G.show()

dessine_suite(f,0.123,100)

#f(x,r) = r*x*(1-x)

def bifurcation(F,terme_init):
    Nmin = 100 # On oublie Nmin premiers termes
    Nmax = 200 # On conserve les termes entre Nmin et Nmax
    epsilon = 0.005 # On fait varier r de epsilon à chaque pas
    r = 2.5 # r initial
    mespoints = []
    while r <= 4.0:
        u = liste_suite(F(r=r),terme_init,Nmax) # On calcule la suite
        for k in range(Nmin,Nmax):
            mespoints = mespoints + [(u[k],r)]
        r = r + epsilon
    G = points(mespoints)
    G.show()

#bifurcation(f,0.102)

var('x,r')
f(x) = r*x*(1-x) #Fonction de base
pts_fixes = solve(f==x,x) # (a) Points fixes
ff = diff(f,x) # Dérivée
ff(x=0) # (b) f'(0)
solve(abs(ff(x=(r-1)/r))<1,r) # (c) Condition point attractif

t = 2*pi/(2^k+1)
u_0 = sin(t)^2
u_k = sin(2^k*t-2*pi)^2
zero = u_k-u_0
zero.simplify_trig()