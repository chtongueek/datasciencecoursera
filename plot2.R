data = read.csv("mod_data.csv")

datetime = strptime(paste(data[,1], data[,2]), "%Y-%m-%d %H:%M:%S")

graphics.off()

<<<<<<< HEAD
plot(datetime, data[,3], 'l', ylab = "Global Active Power, kW")
=======
plot(datetime, data[,3], 'l', ylab = "Global Active Power, kW")
>>>>>>> 1066656d644305b20f8b5b25720e71b8beb510d3
