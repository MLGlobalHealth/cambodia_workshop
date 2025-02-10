
# variables
deriv(S) <- theta - beta * S * I / N - mu * S
deriv(I) <- beta * S * I / N - sigma * I - mu * I
deriv(R) <- sigma * I - mu * R

# initial conditions
initial(S) <- N_init - I_init
initial(I) <- I_init
initial(R) <- 0
N <- S + I + R

# parameters
N_init <- user(100)
I_init <- user(1)
beta <- user(2)
sigma <- user(0.1)
theta <- user(10)
mu <- user(4)

output(N) <- N
