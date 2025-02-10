
# variables
deriv(S_A) <- - ( beta_AA * I_A    + beta_BA * I_B ) * S_A / N_A
deriv(I_A) <- (beta_AA * I_A + beta_BA * I_B ) * S_A / N_A - sigma * I_A
deriv(R_A) <- sigma * I_A   
deriv(S_B) <- - ( beta_AB * I_A  + beta_BB * I_B  ) * S_B / N_B
deriv(I_B) <- (beta_AB * I_A + beta_BB * I_B ) * S_B / N_B - sigma * I_B
deriv(R_B) <- sigma * I_B

# initial conditions
initial(S_A) <- N_A - I_init_A
initial(I_A) <- I_init_A
initial(R_A) <- 0
initial(S_B) <- N_B - I_init_B
initial(I_B) <- I_init_B
initial(R_B) <- 0

# parameters
N_A <- user(1000)
N_B <- user(1000)
I_init_A <- user(1)
I_init_B <- user(1)
beta_AA <- user(2)
beta_BA <- user(2)
beta_AB <- user(2)
beta_BB <- user(2)
sigma <- user(0.5)
