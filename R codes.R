install.packages("ggplot2")
library(ggplot2)
library(forecast)
library(scales)

df <- subset(df, state=='CA')
df

date_num <- c(1:length(df$count_id_indexed))
date_num

df['date_num'] <- date_num
df
max <- max(df$count_id_indexed)
subset(df, df$count_id_indexed == max)      


df_c <- subset(df, df$industry == 'Construction')
df_c
df_c <- na.omit(df_c)

x <- c(1:length(df_c$post_date))
x

df_c$x <- x

model <- lm(count_id_indexed ~ x, data = df_c)
model
plot.ts(df$count_id_indexed)
lines(model$fitted.values, col = 'red')

plot(x, df_c$count_id_indexed, "l")

forecast <- ses(df_c$count_id_indexed)
forecast$mean
accuracy(forecast)

fit_arima <- auto.arima(df_c$count_id_indexed, ic = 'aic')
fit_arima
forecasts <- forecast(fit_arima, h = 22)
frcst <- data.frame(forecasts)
plt <- plot.ts(df_c$count_id_indexed)
lines(forecast$fitted, col = 'red')
forecasts

plot(forecasts, shaded = TRUE, xlab = 'Time', ylab = 'count_id_indexed', sub = 'Construction Industry Forecasts')
#lines(df_c$count_id_indexed, col = 'navy')
lines(forecast$fitted, col = 'red')df_c <- subset(df, df$industry == 'Construction')
df_c
df_c <- na.omit(df_c)

x <- c(1:length(df_c$post_date))
x

df_c$x <- x

model <- lm(count_id_indexed ~ x, data = df_c)
model
plot.ts(df$count_id_indexed)
lines(model$fitted.values, col = 'red')

plot(x, df_c$count_id_indexed, "l")

forecast <- ses(df_c$count_id_indexed)
forecast$mean
accuracy(forecast)
df_c
fit_arima <- auto.arima(df_c$count_id_indexed, ic = 'aic')
fit_arima
forecasts <- forecast(fit_arima, h = 60)
frcst <- data.frame(forecasts)
plt <- plot.ts(df_c$count_id_indexed)
lines(forecast$fitted, col = 'red')
forecasts
plot(forecasts, shaded = TRUE, xlab = 'Time', ylab = 'count_id_indexed', sub = 'Construction Industry Forecasts', 
     ylim = c(-0.5, 3.4), xaxt = 'n')
#lines(df_c$count_id_indexed, col = 'navy')
lines(forecast$fitted, col = 'red')
axis(1, at = c(0, 100, 200, 300, 400, 500, 600), labels = c("Mar (2020)", "Jun", "Sep", "Dec", "Apr (2021)", "Jul", "Oct"))

subset(df_c, df_c$x == 600)




df_h <- subset(df, df$industry == 'Healthcare')
df_h
df_h <- na.omit(df_h)

x <- c(1:length(df_h$count_id_indexed))
x

df_h$x <- x

model <- lm(count_id_indexed ~ x, data = df_h)
model
plot.ts(df$count_id_indexed)
lines(model$fitted.values, col = 'red')

plot(x, df_h$count_id_indexed, "l")

forecast <- ses(df_h$count_id_indexed)
forecast$mean
accuracy(forecast)

fit_arima <- auto.arima(df_h$count_id_indexed, ic = 'aic')
fit_arima
forecasts <- forecast(fit_arima, h = 60)

frcst <- data.frame(forecasts)
plt <- plot.ts(df_h$count_id_indexed)
lines(forecast$fitted, col = 'red')
forecasts

plot(forecasts, shaded = TRUE, xlab = 'Time', ylab = 'count_id_indexed', sub = 'Healthcare Industry Forecasts', ylim = c(-0.4, 3.4),
     xaxt = 'n')
#lines(df_c$count_id_indexed, col = 'navy')
lines(forecast$fitted, col = 'red')
axis(1, at = c(0, 100, 200, 300, 400, 500, 600), labels = c("Mar (2020)", "Jun", "Sep", "Dec", "Apr (2021)", "Jul", "Oct"))

subset(df_h, df_h$x == 600)



df_r <- subset(df, df$industry == 'Retail')
df_r
df_r <- na.omit(df_r)

x <- c(1:length(df_r$count_id_indexed))
x

df_r$x <- x

model <- lm(count_id_indexed ~ x, data = df_r)
model

plot(x, df_r$count_id_indexed, "l")

forecast <- ses(df_r$count_id_indexed)
forecast$mean
accuracy(forecast)

fit_arima <- auto.arima(df_r$count_id_indexed, ic = 'aic')
fit_arima
forecasts <- forecast(fit_arima, h = 60)

frcst <- data.frame(forecasts)
plt <- plot.ts(df_r$count_id_indexed)
lines(forecast$fitted, col = 'red')
forecasts

plot(forecasts, shaded = TRUE, xlab = 'Time', ylab = 'count_id_indexed', sub = 'Retail Industry Forecasts',
     xaxt = 'n')
#lines(df_c$count_id_indexed, col = 'navy')
lines(forecast$fitted, col = 'red')
axis(1, at = c(0, 100, 200, 300, 400, 500, 600), labels = c("Mar (2020)", "Jun", "Sep", "Dec", "Apr (2021)", "Jul", "Oct"))

subset(df_r, df_r$x == 600)

