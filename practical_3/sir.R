# This file compiles and plots an odin model 
library(odin)
library(ggplot2)
library(tidyr)

run_sir_model = function(N, I_init, beta, sigma, max_t){
  # The file name of the model
  model <- "practical_3/odin_models/sir_model.R"
  
  # Compiles the model
  generator <- odin::odin(model)
  mod <- generator$new(user = list(sigma = sigma, beta = beta, 
                                   N = N, I_init = I_init))

  
  # Set time variable
  tt <- seq(0, max_t, by = 0.5)
  
  # Runs the model
  y <- mod$run(tt)
  return (y)
}

data = run_sir_model(N = 500,
                     I_init = 1,
                     beta = 2,
                     sigma = 0.1,
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
