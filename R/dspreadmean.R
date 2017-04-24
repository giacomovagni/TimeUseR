
dspreadmean1 = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n()) %>% spread(value, n, fill = 0)
}

dspreadmean5 = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n()*5) %>% spread(value, n, fill = 0)
}

dspreadmean10 = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n()*10) %>% spread(value, n, fill = 0)
}

dspreadmean15 = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n()*15) %>% spread(value, n, fill = 0)
}

dspreadmean30 = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n()*30) %>% spread(value, n, fill = 0)
}

dplyrmean = function(dta, int = 10, idno, day, giac5) dta[,.N * int,list(idno, day, giac5)] %>% dcast.data.table(idno + day ~ giac5, value.var = 'V1', fill = 0)

dspreadmean10couple = function(data, ...) {
  message('must set varMEN, varWOM and value // set w = 1')
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n()*10) %>% group_by() %>%
    mutate(varWOM = paste('wom', varWOM, sep = '-'), varMEN = paste('men', varMEN, sep = '-')) %>%
    setDT() %>%
    dcast.data.table(hldid + day + w ~ varMEN + varWOM, value.var = 'n', fill = 0)
}






