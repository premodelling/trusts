# Title     : main.R
# Objective : main.R
# Created by: greyhypotheses
# Created on: 30/01/2022



# functions
source(file = 'R/EvaluationHistoriesData.R')
source(file = 'R/EvaluationHistories.R')
source(file = 'R/EvaluationEndpointsData.R')
source(file = 'R/EvaluationEndpoints.R')

# the function EvaluationHistoriesData(.) requires the method/directory names, of interest, in your local
# infections project/package
#     infections/warehouse/modelling/evaluations/histories
#
histories <- EvaluationHistoriesData(methods = c('CNN', 'LSTM'))
ValidationHistoryMAE(histories = histories)
ValidationHistoryLoss(histories = histories)

endpoints <- EvaluationEndpointsData()
EndpointsMAE(endpoints = endpoints)
EndpointsLoss(endpoints = endpoints)


# Prepare directory
pathstr <- file.path(getwd(), 'warehouse', 'modelling', 'outcomes')
if (dir.exists(paths = pathstr)) {
  base::unlink(pathstr, recursive = TRUE)
}
dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)

graphing <- function (data, filename) {
  data.table::fwrite(x = setDT(data), file = file.path(pathstr, paste0(filename, '.csv')))
}
mapply(FUN = graphing, data = list(histories, endpoints), filename = list('histories', 'endpoints'))




