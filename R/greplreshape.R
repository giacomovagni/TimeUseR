
greplreshape = function(data, expr = "HSEX") colnames(data )[ grep(expr, colnames(data)) ]
