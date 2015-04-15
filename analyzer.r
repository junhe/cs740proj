# libraries
#library(ggplot2)
#library(plyr)
#library(reshape2)

# copy the following so you can do sme()
WORKDIRECTORY='/users/jhe/cs740proj/'
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
        print(head(d, 50))
        return(d)
    }

    clean <- function(d)
    {
    }

    func <- function(d)
    {
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
