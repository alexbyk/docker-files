FROM perl
MAINTAINER alexbyk.com <alex@alexbyk.com>

RUN apt update && apt upgrade -y \
  libjpeg62-turbo-dev \
  libpng-dev \
  ghostscript \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz \
&& tar xzf ImageMagick.tar.gz \
&& cd ImageMagick-* \
&& LDFLAGS=-L$( perl -E 'use Config;say((split(",",$Config{ccdlflags}))[-1])' ) ./configure --with-perl=`which perl` --enable-shared  --without-x \
&& make check \
&& make install \
&& ldconfig /usr/local/lib \
&& cd .. \
&& rm -Rf ImageMagick-* ImageMagick.tar.gz

# takes long 
RUN cpanm MongoDB \
&& rm -rf ~/.cpanm/work ~/.cpanm/sources

RUN cpanm \
  Evo \
  IO::Socket::SSL \
  EV \
  IO::Socket::Socks \
  Net::DNS::Native \
  Mojolicious \
  Cpanel::JSON::XS \
  Time::Moment \
  Mojo::Pua \
  Image::PNG::QRCode \
  File::Copy::Recursive \
  Archive::Zip \
  Data::Dump \ 
  Crypt::URandom \
  Crypt::Argon2 \
&& rm -rf ~/.cpanm/work ~/.cpanm/sources

WORKDIR /root

CMD ["bash"]
