data = read.csv("mod_data.csv")

datetime = strptime(paste(data[,1], data[,2]), "%Y-%m-%d %H:%M:%S")

graphics.off()

ymin = 0
ymax = 1.1*max(data[,7:9])
ylim = c(ymin, ymax)

series = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")

plot(datetime, data[,7], 'l', ylab = "Energy", ylim = ylim, col = 1)
par(new = T)
plot(datetime, data[,8], 'l', ylab = "Energy", ylim = ylim, col = 2)
par(new = T)
plot(datetime, data[,9], 'l', ylab = "Energy", ylim = ylim, col = 3)

legend("topright", series, col = 1:3, pch = 1:3, cex = .7)