FROM arm64v8/r-base:4.1.2

RUN  apt-get update && \
          apt-get install -y curl git
#RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     binutils libproj-dev gdal-bin grass qgis qgis-plugin-grass saga libgit2-dev libpng-dev libcairo2-dev gdal-bin libudunits2-dev libgdal-dev libjq-dev

RUN R -e "install.packages(c('remotes'))"
#RUN R -e "install.packages(c('remotes','renv','tinytex','s2','PKI','bookdown','rmarkdown','rticles','rmdshower','languageserver','httpgd'))" \
#   && R -e "install.packages(c('tidyverse','sf','sp','raster','tmap','tmaptools','spData','spDataLarge','leaflet','reticulate','rgee','mlr'))" \ 
#   && R -e "remotes::install_github('paleolimbot/qgisprocess')"

# Create an R user
#ENV HOME /home/user
#RUN useradd --create-home --home-dir $HOME user \
#    && chown -R user:user $HOME
#WORKDIR $HOME/workspace
#USER user

#ENTRYPOINT ["/usr/bin/R"]


#COPY renv.lock renv.lock
#RUN R -e 'renv::consent(provided = TRUE); renv::restore()'

