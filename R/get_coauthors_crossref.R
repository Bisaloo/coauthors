#' Get list of co-authors from CrossRef
#'
#' @inheritParams get_coauthors
#'
#' @importFrom dplyr %>% filter mutate across pull
#' @importFrom tidyr unnest
#' @importFrom purrr map_lgl map
#' @importFrom tools toTitleCase
#' @importFrom utils hasName person as.person

get_coauthors_crossref <- function(name, orcid = NULL) {

  name <- as.person(tolower(name))

  cr_res <- rcrossref::cr_works(cursor = "*", flq = c(query.author = name$family))

  if (!is.null(orcid)) {
    pubs <- cr_res$data %>%
      filter(map_lgl(author, ~ hasName(., "ORCID") && any(grepl(paste0("/", orcid, "$"), .$ORCID))))
  } else {
    pubs <- cr_res$data %>%
      mutate(author = map(author, ~ mutate(., across(.fns = tolower)))) %>%
      filter(map_lgl(author, ~ any(paste(.$given, .$family) %in% paste(name$given, name$family))))
  }

  coauthors <- pubs %>%
    unnest(author) %>%
    mutate(fullname = paste(given, family)) %>%
    pull(fullname) %>%
    unique() %>%
    toTitleCase() %>%
    sort()

  return(coauthors)

}
