# start from the rocker/tidyverse:latest image, not a base r-ver:3.5.0 image
FROM rocker/tidyverse:4

# install packages
RUN R -e "install.packages(c('blastula', 'glue', 'gt', 'here', 'jsonlite', 'paws', 'quarto'))"
RUN R -e "devtools::install_github('matthewhirschey/ddh')"

# copy everything from the current directory into the container
COPY ./ ./src

#set working directory
WORKDIR /src

# when the container starts, start the main.R script
CMD Rscript main.R
