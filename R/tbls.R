
#' load nifti as tibble
#'
#' @param x [RNifti::$.niftiImage] object to convert into tbl
#' @param measure character vector that will be used as the column name for values
#'
#' @return a tbl
#' @export
#'
#' @rdname to_tbl
#' @examples
#' to_tbl(system.file("extdata", "example.nii.gz", package="RNifti"))
#'
to_tbl0 <- function(x, measure="value"){
  checkmate::assert_class(x, "niftiImage")
  checkmate::assert_character(measure)

  dimnames(x) <- sapply(
    seq_along(dim(x)),
    \(i) {
      ids <- seq_len(dim(x)[i])
      switch(
        i,
        `1` = list("i" = ids),
        `2` = list("j" = ids),
        `3` = list("k" = ids),
        `4` = list("t" = ids)
      )
    })
  idx <- arrayInd(
    1:length(x),
    .dim = dim(x),
    .dimnames = dimnames(x),
    useNames = TRUE) |>
    tibble::as_tibble() |>
    dplyr::mutate("{measure}" := as.vector(.env$x))
}


#' @rdname to_tbl
#'
#' @param file location of nifti to read into tbl See [RNifti::readNifti()]
#' @param volumes integer vector. See [RNifti::readNifti()]
#'
#' @export
#' @examples
#' nii <- RNifti::readNifti(file=system.file("extdata", "example.nii.gz", package="RNifti"))
#' to_tbl0(nii)
#' to_tbl(system.file("extdata", "example_4d.nii.gz", package="RNifti"))
to_tbl <- function(file, measure="value", volumes = NULL){
  checkmate::assert_character(file, len = 1)

  value <- RNifti::readNifti(file, volumes = volumes)
  to_tbl0(value, measure = measure)
}

