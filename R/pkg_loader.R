#' Package Loader and Set Up
#'
#' This function is intended to be used to load most common used packages and
#' other environment setups (Credit: Rob M from Staples Days)
#'
#' @param clear_env Clear global environment. Default is FALSE.
#' @param dir Set working directory.
#' @param base_pkgs Load base packages (dplyr, ggplot2, etc.). Default is TRUE.
#' @param extra_pkgs Load additional packages. Default is FALSE.
#' @param sci_off Turn off scientific notation. Default is TRUE.
#' @import utils
#' @export
#' @examples
#' pkg_loader()
#' pkg_loader(clear_env = T, base_pkgs = T)
#' pkg_loader(base_pkgs = T, extra_pkgs = c('caret'))


pkg_loader <- function(clear_env = F, dir = NULL, base_pkgs = T, extra_pkgs = NULL, sci_off = T){

  # clean env
  if(clear_env == T){
    rm(list = ls(pos = '.GlobalEnv'), pos = '.GlobalEnv')
    closeAllConnections()
  }

  # dir
  if(!missing(dir)) setwd(dir) else setwd(getwd())

  # pkgs
  if(base_pkgs == T){
    pkgs <- c('dplyr', 'ggplot2', 'reshape2', 'RODBC', 'stats', 'stringr')
    install <- pkgs[pkgs %in%  unique(data.frame(utils::installed.packages(), stringsAsFactors = F)[, 'Package']) == F]

    if(length(install) > 0){
      message('\n\tdid not find packages: ', paste0(install, collapse=', '))
      message('\n\tinstalling now')
      utils::install.packages(install)
    }
    suppressPackageStartupMessages(lapply(pkgs, require, character.only = T))
  }

  if (!missing(extra_pkgs)) {
    suppressPackageStartupMessages(lapply(extra_pkgs, require, character.only = T))
  }

  cat('\n\t - Your current working directory is ', getwd())
  cat('\n\t - The following packages have been loaded : \n\t\t', paste(names(utils::sessionInfo()[[6]])[order(names(utils::sessionInfo()[[6]]))], collapse = ', '), '\n\n')

  if (sci_off == T) options(scipen = 999)
}
