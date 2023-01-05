
#' load nifti as tibble
#'
#' @param value [RNifti::$.niftiImage] object to convert into tbl
#' @param measure character vector that will be used as the column name for values
#'
#' @return a tbl
#' @export
#'
#' @rdname to_tbl0
#' @examples
#' to_tbl(system.file("extdata", "example.nii.gz", package="RNifti"))
#'
to_tbl0 <- function(value, measure="value"){
  checkmate::assert_class(value, "niftiImage")
  checkmate::assert_character(measure)

  dimnames(value) <- list(
    "x" = seq_len(dim(value)[1]),
    "y" = seq_len(dim(value)[2]),
    "z" = seq_len(dim(value)[3]))
  cubelyr::as.tbl_cube(value, met_name=measure) |>
    tibble::as_tibble()
}

#' @rdname to_tbl0
#'
#' @param file [RNifti::$.niftiImage] object to convert into tbl See [RNifti::readNifti()]
#' @param volumes integer vector. See [RNifti::readNifti()]
#'
#' @export
#' @examples
#' nii <- RNifti::readNifti(file=system.file("extdata", "example.nii.gz", package="RNifti"))
#' to_tbl0(nii)
to_tbl <- function(file, measure="value", volumes = NULL){
  value <- RNifti::readNifti(file, volumes = volumes)
  to_tbl0(value, measure = measure)
}
