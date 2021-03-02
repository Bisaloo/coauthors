#' Get list of co-authors
#'
#' @param name (required) Name of person for which you want the co-authors. Can
#' be a [person] object or a character string that will be coerced as a [person]
#' object.
#' @param orcid (optional) ORCiD of the person for which you want to co-authors.
#' If provided, only articles where the author (`name`) added their ORCiD will
#' be used to return the list of co-authors. This might result in the omission
#' of some co-authors.
#' @param source (required) The data source. Currently only `"crossref"`
#'
#' @examples
#' if (interactive()) {
#' get_coauthors("Hugo Gruson")
#' get_coauthors("Hugo Gruson", orcid = "0000-0002-4094-1476")
#' }
#'
#' @export
get_coauthors <- function(name, orcid, source = c("crossref")) {

  source <- match.arg(source)

  res <- switch(source,
    "crossref" = get_coauthors_crossref(name, orcid)
  )

  return(res)

}
