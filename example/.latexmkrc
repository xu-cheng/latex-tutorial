# vim: set filetype=perl:

$pdf_mode = 1;
set_tex_cmds('-shell-escape -synctex=1 -file-line-error %O %S');
$max_repeat = 5;

# File extensions to remove when cleaning
# Ref: https://www.gitignore.io/api/latex
my @clean_ext = qw(
  %R-blx.aux
  %R-blx.bib
  acn
  acr
  alg
  aux
  bbl
  bcf
  blg
  brf
  cb
  cb2
  cpt
  cut
  dvi
  fdb_latexmk
  fls
  fmt
  fot
  glg
  glo
  gls
  glsdefs
  idx
  ilg
  ind
  ist
  lb
  listing
  loa
  loe
  lof
  log
  lol
  lot
  lox
  nav
  out
  pdfsync
  pre
  run.xml
  snm
  soc
  synctex
  synctex(busy)
  synctex.gz
  synctex.gz(busy)
  tdo
  thm
  toc
  upa
  upb
  vrb
  xcp
  xdv
  xmpi
  xyc
  *-converted-to.*
  */*-converted-to.*
  */*/*-converted-to.*
  */*/*/*-converted-to.*
);
$clean_ext = join ' ', @clean_ext;

no warnings 'redefine';

# Overwrite `cleanup1` functions to support more general pattern in $clean_ext.
# Ref: https://github.com/e-dschungel/latexmk-config/blob/master/latexmkrc
sub cleanup1 {
    my $dir = fix_pattern( shift );
    my $root_fixed = fix_pattern( $root_filename );
    foreach (@_) {
        (my $name = (/%R/ || /[\*\?]/) ? $_ : "%R.$_") =~ s/%R/$dir$root_fixed/;
        unlink_or_move( glob( "$name" ) );
    }
}
