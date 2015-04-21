# libraries
library(ggplot2)
library(plyr)
library(reshape2)

# copy the following so you can do sme()
# WORKDIRECTORY='/u/j/h/jhe/workdir/cs740proj'
WORKDIRECTORY='/Users/junhe/BoxSync/workdir/cs740proj'
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
    load <- function(fpath)
    {
        #d = read.csv('./benchmark_read_128_files_1KB.txt.parsed', header=T)
        d = read.csv(fpath, header=T)
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

				# n_packets,idle_age,nw_dst,dl_src,actions,idle_timeout,cookie,tp_src,duration,table,nw_src,n_bytes,priority,tp_dst,dl_dst,in_port
        
        tmp = levels(d$nw_src)
        # d$flow = with(d, paste(nw_dst,dl_src, tp_src, nw_src, tp_dst, dl_dst, in_port, sep=':'))
        # d$flow = interaction(d$nw_src, d$tp_src, d$nw_dst, d$tp_dst, sep=':')
        # d$flow = paste(d$nw_src, d$tp_src, d$nw_dst, d$tp_dst, sep=':')
        d$flow = paste(d$nw_src, d$nw_dst, sep='->')

        p <- ggplot(d, aes(x=batchid, y=n_bytes/1024, color=flow)) +
            geom_point() +
            # geom_line() +
            # scale_color_manual(values=cbPalette) +
            xlab('second')
        print(p)
    }

    do_main <- function()
    {
        files = list.files(path="./benchmark2/", pattern="*parsed")
        print(files)
        for (f in files) {
                print(f)
                d = load(paste('./benchmark2/',f,sep=''))
                d = clean(d)
                func(d)
                r = readline()
                if (r == 'a') {
                        return()
                }
        }
    }
    do_main()
}

main <- function()
{
    explore.FSJ386323()
}
main()

