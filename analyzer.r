# libraries
library(ggplot2)
library(plyr)
library(reshape2)

# copy the following so you can do sme()
WORKDIRECTORY='/u/j/h/jhe/workdir/cs740proj'
THISFILE     ='analyzer.r'
setwd(WORKDIRECTORY)
sme <- function()
{
    setwd(WORKDIRECTORY)
    source(THISFILE)
}

explore.FSJ386323 <- function()
{
    transfer <- function()
    {
    }
    load <- function()
    {
        d = read.csv('./benchmark_read_128_files_1KB.txt.parsed', header=T)
        #d = read.csv('./try.parsed', header=T)
        #print(head(d, 50))
        return(d)
    }

    clean <- function(d)
    {
        return(d)
    }

    func <- function(d)
    {
        cbPalette <- c("#89C5DA", "#DA5724", "#74D944", "#CE50CA", "#3F4921", "#C0717C", "#CBD588", "#5F7FC7", 
                "#673770", "#D3D93E", "#38333E", "#508578", "#D7C1B1", "#689030", "#AD6F3B", "#CD9BCD", 
                "#D14285", "#6DDE88", "#652926", "#7FDCC0", "#C84248", "#8569D5", "#5E738F", "#D1A33D", 
                "#8A7C64", "#599861")

        d$flow = interaction(d$nw_src, d$nw_dst, sep='->')
        d = ddply(d, .(flow), function(x) {x$id = seq_along(x$duration); x})
        #p <- ggplot(d, aes(x=duration, y=n_packets)) +
        p <- ggplot(d, aes(x=id, y=n_bytes/1024, color=flow)) +
            geom_point() +
            scale_color_manual(values=cbPalette) 
        print(p)
    }

    do_main <- function()
    {
        d = load()
        d = clean(d)
        func(d)
    }
    do_main()
}

main <- function()
{
    explore.FSJ386323()
}
main()
