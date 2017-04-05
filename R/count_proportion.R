
fn = function(data) data %>% mutate(n = round( n / sum(n), 3) * 100 )

nb0 = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n_distinct(hldid)) %>% mutate(p = paste('(', round( n / sum(n), 3) * 100, '%', ')', sep = '') ) %>%
    mutate(n = paste(n, p)) %>% select(-p)
}

nb = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n_distinct(hldid)) %>% mutate(n = paste(round( n / sum(n), 3) * 100, '%', sep = '') )
}

nbR = function(data, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise(n = n_distinct(hldid)) %>% mutate(n = round( n / sum(n), 3) * 100 )
}
