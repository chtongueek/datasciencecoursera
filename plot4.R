data = read.csv("mod_data.csv")

datetime = strptime(paste(data[,1], data[,2]), "%Y-%m-%d %H:%M:%S")

graphics.off()

par(mfrow = c(2,2))

### Plot 1 ###
plot(datetime, data[,3], 'l', ylab = "Global Active Power, kW")

### Plot 2 ###
plot(datetime, data$Voltage, 'l', ylab = "Voltage")

### Plot 3 ###
ymin = 0
ymax = 1.1*max(data[,7:9])
ylim = c(ymin, ymax)

series = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")

plot(datetime, data[,7], 'l', ylab = "Energy", ylim = ylim, col = 1)
par(new = T)
plot(datetime, data[,8], 'l', ylab = "Energy", ylim = ylim, col = 2)
par(new = T)
plot(datetime, data[,9], 'l', ylab = "Energy", ylim = ylim, col = 3)

legend("topright", series, col = 1:3, pch = 1:3, cex = .3)

### Plot 4 ###
plot(datetime, data[,4], 'l', ylab = "Global Reactive Power, kW")