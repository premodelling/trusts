# Title     : main.R
# Objective : main.R
# Created by: greyhypotheses
# Created on: 30/01/2022



# functions
source(file = 'R/EvaluationHistoriesData.R')
source(file = 'R/EvaluationHistories.R')

melted <- EvaluationHistoriesData()
ValidationHistoryMAE(melted = melted)
ValidationHistoryLoss(melted = melted)



