# This file compiles and plots an odin model 
library(odin)
library(ggplot2)
library(tidyr)

run_example_1_model = function(N_init, I_init, beta, sigma, theta, mu, max_t){
  # The file name of the model
  model <- "practical_4/odin_models/example1.R"

  # Compiles the model
  generator <- odin::odin(model)
  mod <- generator$new(user = list(sigma = sigma, beta = beta, theta = theta,
                                   mu = mu, N_init = N_init, I_init = I_init))
  
  
  # Set time variable
  tt <- seq(0, max_t, by = 0.5)
  
  # Runs the model
  y <- mod$run(tt)
  return (y) 

}

data = run_example_1_model(N_init = 500,
                           I_init = 1,
                           beta = 2,
                           sigma = 1,
                           theta = 2,
                           mu = 0.1, 
                           max_t = 50)

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
