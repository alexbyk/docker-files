use Evo;
use Image::Magick;
use Benchmark ':all';

sub filter ($n, $filter, %other) {
  my $im = Image::Magick->new;
  $im->Read('2560x1920.jpg');
  $im->Resize(width => 2560 / $n, height => 1920 / $n, filter => $filter, %other);
  die unless $im->Get('width') == 2560 / $n;
}


my $N = 5;
cmpthese 10, {
  Lanczos  => sub { filter($N, 'Lanczos') },
  Lanczos2 => sub { filter($N, 'Lanczos2') },
};

1;
