data = read.csv("mod_data.csv")

datetime = strptime(paste(data[,1], data[,2]), "%Y/%m/%d %H:%m:%s")

graphics.off()

<<<<<<< HEAD
hist(data[,3], xlab = "Global Active Power (kW)", col = '2')
=======
hist(data[,3], xlab = "Global Active Power (kW)", col = '2')

dev.copy(png, "plot1.png")
>>>>>>> 1066656d644305b20f8b5b25720e71b8beb510d3
