# Title     : EvaluationHistories.R
# Objective : Evaluation Histories
# Created by: greyhypotheses
# Created on: 30/01/2022


ValidationHistoryMAE <- function (melted) {

  excerpt <- melted %>%
    dplyr::filter(Metric == 'val_mean_absolute_error')
  excerpt$history <- as.factor(x = excerpt$history)

  excerpt %>%
    ggplot(mapping = aes(x = epoch, y = Estimate, colour = history)) +
    geom_point(alpha = 0.75, size = 2.5) +
    facet_wrap(~method, scales = 'free_y') +
    coord_trans(y = scales::log_trans()) +
    theme_minimal() +
    theme(panel.spacing = unit(x = 3, units = 'lines'),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_line(size = 0.1),
          plot.title = element_text(hjust = 0.5),
          strip.text.x = element_text(size = 11, face = 'bold'),
          plot.caption = element_text(hjust = 0, size = 11, colour = 'darkgrey'),
          axis.text.x = element_text(size = 11, angle = 90), axis.text.y = element_text(size = 11),
          axis.title.x = element_text(size = 13), axis.title.y = element_text(size = 13)) +
    xlab(label = '\nEpoch\n') +
    ylab(label = '\nValidation: MAE\n') +
    guides(shape = guide_legend(title='Days of history\nfor prediction'), colour = guide_legend(title='Days of history\nfor prediction') ) +
    scale_colour_hue(l = 25, c = 85)

}

ValidationHistoryLoss <- function (melted) {

  excerpt <- melted %>%
    dplyr::filter(Metric == 'val_loss')
  excerpt$history <- as.factor(x = excerpt$history)

  excerpt %>%
    ggplot(mapping = aes(x = epoch, y = Estimate, colour = history)) +
    geom_point(alpha = 0.75, size = 2.5) +
    facet_wrap(~method, scales = 'free_y') +
    coord_trans(y = scales::log_trans()) +
    theme_minimal() +
    theme(panel.spacing = unit(x = 3, units = 'lines'),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_line(size = 0.1),
          plot.title = element_text(hjust = 0.5),
          strip.text.x = element_text(size = 11, face = 'bold'),
          plot.caption = element_text(hjust = 0, size = 11, colour = 'darkgrey'),
          axis.text.x = element_text(size = 11, angle = 90), axis.text.y = element_text(size = 11),
          axis.title.x = element_text(size = 13), axis.title.y = element_text(size = 13)) +
    xlab(label = '\nEpoch\n') +
    ylab(label = '\nValidation: Loss\n') +
    guides(shape = guide_legend(title='Days of history\nfor prediction'), colour = guide_legend(title='Days of history\nfor prediction') ) +
    scale_colour_hue(l = 25, c = 85)

}

















