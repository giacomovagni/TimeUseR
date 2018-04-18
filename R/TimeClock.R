
# x = c(100,123,140, 10, 1403)

TimeClock = function(x){
  
  min = TimeHoursCalCpp3(x)
  hour = TimeHoursCalCpp4(x)
  
  min[ min < 10 ] = paste(0, min[ min < 10 ], sep = '') 
  min[ min >= 10 ] = paste(min[ min >= 10 ], sep = '')
  
  hour[ hour < 10 ] = paste(0, hour[ hour < 10 ], sep = '') 
  hour[ hour >= 10 ] = paste(hour[ hour >= 10 ], sep = '')
  
  clock = paste(hour, ':', min, sep = '')
  return(clock)
}


