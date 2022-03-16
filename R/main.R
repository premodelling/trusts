# Title     : main.R
# Objective : main.R
# Created by: greyhypotheses
# Created on: 30/01/2022



# functions
source(file = 'R/EvaluationHistoriesData.R')
source(file = 'R/EvaluationHistories.R')
source(file = 'R/EvaluationEndpointsData.R')
source(file = 'R/EvaluationEndpoints.R')

melted <- EvaluationHistoriesData(methods = c('CNN', 'LSTM'))
ValidationHistoryMAE(melted = melted)
ValidationHistoryLoss(melted = melted)

endpoints <- EvaluationEndpointsData()
EndpointsMAE(endpoints = endpoints)
EndpointsLoss(endpoints = endpoints)


