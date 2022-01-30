# Title     : EvaluationEndpoints.R
# Objective : Evaluation Endpoints
# Created by: greyhypotheses
# Created on: 30/01/2022

EvaluationEndpoints <- function () {

  # the validation metrics
  validations <- read.csv(file = 'data/modelling/evaluations/endpoints/validations.csv')
  validations$group <- 'validations'

  # the test metrics
  tests <- read.csv(file = 'data/modelling/evaluations/endpoints/tests.csv')
  tests$group <- 'tests'

  # concatenating
  endpoints <- rbind(validations, tests)

  # converting the method & group fields to factor fields
  endpoints$method <- factor(x = endpoints$method, levels = c('CNN', 'LSTM'))
  endpoints$group <- factor(x = endpoints$group, levels = c('validations', 'tests'))

  # drawing
  melted <- endpoints %>%
    gather(key = 'Metric', value = 'Estimate', -c('method', 'history', 'ahead', 'group'))

  melted %>%
    dplyr::filter(group == 'tests') %>%
    ggplot(mapping = aes(x = history, y = Estimate, colour = method)) +
    geom_point(alpha = 0.65, size = 3) +
    facet_wrap(~Metric, labeller = as_labeller(c('loss' = 'Loss', 'mae' = 'MAE'))) +
    coord_trans(y = scales::log_trans()) +
    theme_minimal()  +
    theme(panel.spacing = unit(x = 3, units = 'lines'),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_line(size = 0.1),
          plot.title = element_text(hjust = 0.5),
          strip.text.x = element_text(size = 11, face = 'bold'),
          plot.caption = element_text(hjust = 0, size = 11, colour = 'darkgrey'),
          axis.text.x = element_text(size = 11, angle = 90), axis.text.y = element_text(size = 11),
          axis.title.x = element_text(size = 13), axis.title.y = element_text(size = 13)) +
    xlab(label = '\n # of past days data\n(for predictions)\n') +
    ylab(label = '\nestimate\n') +
    guides(col = guide_legend(title='Modelling\nAlgorithm')) +
    scale_y_continuous(breaks = c(0, 0.5, 2.5, 5.0, 7.5, 10)) +
    scale_colour_manual(values = c('orange', 'black'))








}