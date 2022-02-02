# Title     : EvaluationEndpoints.R
# Objective : Evaluation Endpoints
# Created by: greyhypotheses
# Created on: 30/01/2022


EndpointsMAE <- function (endpoints) {

  melted <- endpoints %>%
    gather(key = 'Metric', value = 'Estimate', -c('method', 'history', 'ahead', 'phase'))

  melted %>%
    dplyr::filter(Metric == 'mae') %>%
    ggplot(mapping = aes(x = history, y = Estimate, colour = method)) +
    geom_point(alpha = 0.65, size = 3) +
    facet_wrap(~phase, nrow = 2, ncol = 1, labeller = as_labeller(c('validation' = 'Validation Phase', 'testing' = 'Testing Phase')),
               scales = 'free_y') +
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
    xlab(label = '\n# of past days data\n(for predictions)\n') +
    ylab(label = '\nMAE\n') +
    guides(col = guide_legend(title='Modelling\nAlgorithm',
                              title.theme = element_text(size = 12),
                              label.theme = element_text(size = 11))) +
    scale_y_continuous(breaks = c(0, 0.50, 0.55, 0.60, 0.75, 1.0, 1.5)) +
    scale_colour_manual(values = c('orange', 'black'))

}


EndpointsLoss <- function (endpoints) {

  melted <- endpoints %>%
    gather(key = 'Metric', value = 'Estimate', -c('method', 'history', 'ahead', 'phase'))

  melted %>%
    dplyr::filter(Metric == 'loss') %>%
    ggplot(mapping = aes(x = history, y = Estimate, colour = method)) +
    geom_point(alpha = 0.65, size = 3) +
    facet_wrap(~phase, nrow = 2, ncol = 1, labeller = as_labeller(c('validation' = 'Validation Phase', 'testing' = 'Testing Phase')),
               scales = 'free_y') +
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
    xlab(label = '\n# of past days data\n(for predictions)\n') +
    ylab(label = '\nLoss\n') +
    guides(col = guide_legend(title='Modelling\nAlgorithm',
                              title.theme = element_text(size = 12),
                              label.theme = element_text(size = 11))) +
    scale_y_continuous(breaks = c(0, 0.5, 0.6, 1.0, 2.5, 5.0, 7.5, 10)) +
    scale_colour_manual(values = c('orange', 'black'))

}

