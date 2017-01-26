FROM perl
MAINTAINER alexbyk.com <alex@alexbyk.com>

RUN apt update && apt upgrade -y \
  libjpeg62-turbo-dev \
  libpng-dev \
  ghostscript \
&& rm -rf /var/lib/apt/lists/*

RUN cpanm -v \
  Evo \
  Cpanel::JSON::XS \
  Time::Moment \
  Mojolicious \
  Mojo::Pua \
  MongoDB \
  Image::PNG::QRCode \
  File::Copy::Recursive \
  IO::Socket::SSL \
  EV \
  Archive::Zip \
&& rm -rf ~/.cpanm/work ~/.cpanm/sources

RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz && tar xzf ImageMagick.tar.gz

RUN cd ImageMagick-* \
&& LDFLAGS=-L$( perl -E 'use Config;say((split(",",$Config{ccdlflags}))[-1])' ) ./configure --with-perl=`which perl` --enable-shared  --without-x \
&& make check \
&& make install \
&& ldconfig /usr/local/lib \
&& cd .. && rm -Rf ImageMagick-* ImageMagick.tar.gz

WORKDIR /root

CMD ["bash"]
