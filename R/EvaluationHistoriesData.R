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


EvaluationHistoriesData <- function () {

  lstm <- .EvaluationHistoriesData(method = 'LSTM')
  cnn <- .EvaluationHistoriesData(method = 'CNN')

  history <- rbind(lstm, cnn)
  history$method <- as.factor(history$method)

  melted <- history %>%
    select(!ahead) %>%
    gather(key = 'Metric', value = 'Estimate', -c('epoch', 'history', 'method'))
  melted$Metric <- factor(x = melted$Metric,
                          levels = c('val_loss', 'val_mean_absolute_error'))

  return(melted)

}