# Title     : EvaluationEndpointsData.R
# Objective : Evaluation Endpoints Data
# Created by: greyhypotheses
# Created on: 30/01/2022

EvaluationEndpointsData <- function () {

  # the validation metrics
  validations <- read.csv(file = '../infections/warehouse/modelling/evaluations/endpoints/validations.csv')
  validations$phase <- 'validation'

  # the test metrics
  tests <- read.csv(file = '../infections/warehouse/modelling/evaluations/endpoints/tests.csv')
  tests$phase <- 'testing'

  # concatenating
  endpoints <- rbind(validations, tests)

  # converting the method & group fields to factor fields
  endpoints$method <- factor(x = endpoints$method, levels = c('CNN', 'LSTM'))
  endpoints$phase <- factor(x = endpoints$phase, levels = c('validation', 'testing'))

  return(endpoints)

}