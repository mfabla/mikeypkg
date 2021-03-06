#' ggplot2 template
#'
#' This is a template function to use for ggplot2 outputs. Use this as an extension to a ggplot2 script.
#'
#' @import ggplot2
#' @inheritParams  ggplot2::theme_bw
#' @export
#'
#' @examples
#' x_var <- factor(sample(x = 1:2, size = 100, replace = T), label = c('False', 'True'))
#' y_var <- sample(x = 1:100, size = 100, replace = T)
#' xy = data.frame(x_var, y_var)
#'
#' ggplot(xy, aes(x = x_var)) + geom_bar() + ggplot2_template() + ggtitle('False vs True')



ggplot2_template <- function(){
    theme(axis.line.x      = element_line(color = 'black')
        , axis.line.y      = element_line(color = 'black')
        , axis.text.x      = element_text(colour = 'black', size = 10)
        , axis.text.y      = element_text(colour = 'black')
        , axis.title.y     = element_text(size = 11)
        , panel.background = element_blank()
        , panel.border     = element_blank()
        , panel.grid.major = element_blank()
        , panel.grid.minor = element_blank()
        , plot.title       = element_text(size = 16)
        , legend.key       = element_blank()
        , legend.title     = element_blank())
}
