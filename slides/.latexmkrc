# vim: set filetype=perl:

$pdf_mode = 1;
$pdflatex = 'lualatex --shell-escape --synctex=1 --file-line-error %O %S';
$max_repeat = 5;
my @clean_ext = qw(
  %R-blx.aux
  %R-blx.bib
  _minted-%R
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
);
$clean_ext = join ' ', @clean_ext;
