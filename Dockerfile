FROM pelson/conda32_obvious_ci

MAINTAINER Filipe Fernandes <ocefpaf@gmail.com>

# This is returning non-zero exit.  I cannot force i686 here :-(
# RUN yum -y update

# conda patch and etc.
RUN yum install -y patch.i686
# RUN yum install -y file.i686

# Qt, matplotlib deps, vispy
RUN yum install -y libXext.i686
RUN yum install -y libSM.i686
RUN yum install -y libXrender.i686
# RUN yum install -y mesa-libGL.i686
RUN yum install -y fontconfig.i686

# octant.
# RUN yum install -y gcc-gfortran.i686

# Udunits2
RUN yum install -y expat-devel.i686

# rasterio.
RUN yum install -y compat-expat1.i686

# ecmwf_grib.
RUN yum install -y openjpeg-devel.i686

# nco.
RUN yum install -y bison.i686
RUN yum install -y byacc.i686
RUN yum install -y flex.i686
RUN yum install -y gsl-devel.i686
RUN yum install -y antlr.i686

# Update miniconda.
RUN conda update --yes --all

# Add IOOS channel.
RUN conda config --add channels ioos --force

# Clean it up.
RUN conda clean -y -t
