
# variables
deriv(S) <- alpha * R - beta * S * I / N 
deriv(E) <- beta * S * I / N - gamma * E
deriv(I) <-  gamma * E - sigma * I
deriv(R) <- sigma * I - alpha * R  

# initial conditions
initial(S) <- N - I_init
initial(E) <- 0
initial(I) <- I_init
initial(R) <- 0

# parameters
N <- user(1000)
I_init <- user(1)
beta <- user(2)
gamma <- user(0.1)
sigma <- user(0.5)
alpha <- user(0.001)
