all_same <- function(seq, na.rm=FALSE, by.col=FALSE, return_list=FALSE, for_empty=FALSE, for_all_na=TRUE) {

  #handle empty input
  if (length(seq) == 0) {
    return (for_empty)
  }

  #return_list (parameter): whether the prog. should return a vector of TRUE/FALSE or just one T/F
  result = c()
  if (na.rm && !is.data.frame(seq)) {
    seq <- seq[!is.na(seq)]
  }

  #handle input that is empty after removal of na
  if (length(seq) == 0) {
    return (for_all_na)
  }

  if (inherits(seq, "data.frame")) {
    if (by.col) {
      for (col in 1:length(seq)) {
        result <- c(result, all_same(seq[[col]], na.rm=na.rm, for_empty=for_empty, for_all_na=for_all_na))
      }
      if (return_list) {
        return (result)
      } else {
        return (all(result))
      }
    } else {
      if (nrow(seq) == 0) {
        return (for_empty)
      }
      #check one by one
      if (na.rm) {
        non_na <- NULL
        found <- FALSE
        for (i in 1:nrow(seq)) {
          for (j in 1:ncol(seq)) {
            if (!found && !is.na(seq[i, j])) {
              non_na <- seq[i, j]
              found <- TRUE
            }
          }
          if (found) {break}
        }
        if (is.null(non_na)) {
          return (for_all_na)
        }

        for (i in 1:nrow(seq)) {
          for (j in 1:ncol(seq)) {
            if (is.na(seq[i, j])) {next}
            if (seq[i, j] != non_na) {
              return (FALSE)
            }
          }
        }
        return (TRUE)
      } else {
        #na.rm is FALSE
        if (is.na(seq[1, 1])) {
          if (all(is.na(seq)))
          return (all(is.na(seq)))
        }
        for (i in 1:nrow(seq)) {
          for (j in 1:ncol(seq)) {
            if (!is.na(seq[i, j])) {
              if (seq[i, j] != seq[1, 1]) {return (FALSE)}
            } else {return (FALSE)}
          }
        }
        return (TRUE)
      }
    }
  }

  #handle factor input
  if (is.factor(seq)) {
    return (length(unique(seq)) == 1)
  }

  #handle vector&list input
  if (is.vector(seq) || is.array(seq)) {
    if (any(is.na(seq))) {
      if (all(is.na(seq))) {
        return (for_all_na)
      }
      return (FALSE)
    }
    #handle list independently
    if (typeof(seq) == 'list') {
      if (length(seq) == 1) {
        return (TRUE)
      }
      for (i in 1:(length(seq)-1)) {
        if (!identical(seq[[i]], seq[[i+1]])) {
          return (FALSE)
        }
      }
      return (TRUE)
    }

    for (i in seq) {
      if (i != seq[1]) {
        return (FALSE)
      }
    }
    return (TRUE)
  }

  warning('The data type of the input is not supported. NA is returned')
  return (NA)
}
