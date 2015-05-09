data = read.csv("mod_data.csv")

datetime = strptime(paste(data[,1], data[,2]), "%Y-%m-%d %H:%M:%S")

graphics.off()

plot(datetime, data[,3], 'l', ylab = "Global Active Power, kW")
