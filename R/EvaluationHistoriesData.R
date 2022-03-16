# Title     : EvaluationHistoriesData.R
# Objective : Evaluation Histories Data
# Created by: greyhypotheses
# Created on: 30/01/2022

.EvaluationHistoriesData <- function (method) {

  path <- file.path(getwd(), '..', 'infections', 'warehouse', 'modelling', 'evaluations', 'histories', method)
  files <- list.files(path = path, pattern = '*.csv')

  .Read <- function (filename) {
    frame <- data.table::fread(file.path(path, filename))
    frame$epoch <- seq(from = 1, to = nrow(frame))
    return(frame)
  }

  segments <- lapply(X = files, FUN = .Read)
  history <- dplyr::bind_rows(segments)

  return(history)

}


EvaluationHistoriesData <- function (methods) {

  # the evaluation history per method
  histories <- lapply(X = methods, FUN = .EvaluationHistoriesData)
  history <- dplyr::bind_rows(histories)

  # convert the <method> field to a factor field
  history$method <- as.factor(history$method)

  melted <- history %>%
    select(!ahead) %>%
    gather(key = 'Metric', value = 'Estimate', -c('epoch', 'history', 'method'))
  melted$Metric <- factor(x = melted$Metric,
                          levels = c('val_loss', 'val_mean_absolute_error'))

  return(melted)

}