## read RDS
model <- readRDS("lm_model.RDS")

model$finalModel

data("BostonHousing")

## save model
saveRDS(lm_model, "lm_model.RDS")

## predict data
predict(model, newdata = BostonHousing[1:20, ])

