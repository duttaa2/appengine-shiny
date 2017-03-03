FROM rocker/shiny
MAINTAINER Mark Edmondson (r@sunholo.com)

# install R package dependencies
RUN apt-get install -y libssl-dev
    
## Install packages from CRAN
RUN install2.r --error \ 
    -r 'http://cran.rstudio.com' \
    googleAuthR \
    ## install Github packages
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

EXPOSE 8080

## copy configuration file
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

## assume shiny app is in build folder /shiny
COPY ./shiny/ /srv/shiny-server/shiny/

