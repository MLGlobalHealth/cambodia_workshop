## This file compiles and plots an odin model 
library(odin)
library(ggplot2)
library(tidyr)

run_example_4_model = function(N_A, N_B, I_init_A, I_init_B, beta_AA, beta_BA, 
                               beta_AB, beta_BB, sigma, max_t){
  # The file name of the model
  model <- "practical_4/odin_models/example4.R"
  
  # Compiles the model
  generator <- odin::odin(model)
  mod <- generator$new(user = list(sigma = sigma, beta_AA = beta_AA, 
                                   beta_BA = beta_BA, beta_AB = beta_AB, 
                                   beta_BB = beta_BB, 
                                   N_A = N_A, N_B = N_B,
                                   I_init_A = I_init_A, I_init_B = I_init_B))
  
  
  # Set time variable
  tt <- seq(0, max_t, by = 0.5)
  
  # Runs the model
  y <- mod$run(tt)
  return (y)
}

data = run_example_4_model(N_A = 100, 
                           N_B = 100, 
                           I_init_A = 1, 
                           I_init_B = 1, 
                           beta_AA = 0.5, 
                           beta_BA = 0.5, 
                           beta_AB = 0.5, 
                           beta_BB = 0.5, 
                           sigma = 0.1, 
                           max_t = 100)

data_long = gather(data.frame(data), 
                   key = variable, 
                   value = value, 
                   -t)

p = ggplot(data_long) +
  geom_line(aes(t, value, col = variable), linewidth = 2) + 
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) + 
  xlab("Time") + ylab("Number of people") +
  theme_bw() +
  theme(legend.title=element_blank(), 
        axis.text.x = element_text(size=16),
        axis.text.y = element_text(size=16),
        text = element_text(size = 16))

print(p)