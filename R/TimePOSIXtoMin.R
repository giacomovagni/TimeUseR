
TimePOSIXtoMin = function(hourPOSIX = '12:30:03'){
  hour = unlist(strsplit(x = hourPOSIX, split = ':', fixed = T))
  hourMin = as.numeric(hour[1]) * 60 + as.numeric(hour[2]) 
  sec = as.numeric(hour[3])
  
  cat (hourMin, 'minutes and', sec, 'secondes', '\n', '\n')
  return(hourMin)
}


