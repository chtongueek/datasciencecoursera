data = read.csv("mod_data.csv")

datetime = strptime(paste(data[,1], data[,2]), "%Y/%m/%d %H:%m:%s")

graphics.off()

hist(data[,3], xlab = "Global Active Power (kW)", col = '2')