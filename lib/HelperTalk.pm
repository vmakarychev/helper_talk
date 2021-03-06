package HelperTalk;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  #$self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  #$r->get('/')->to('example#welcome');
  $r->route( '/' )->via( 'get' )->to( 'search#default' );
  $r->route( '/' )->via( 'post' )->to( 'search#result' );
}

1;
