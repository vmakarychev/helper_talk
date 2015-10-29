package HelperTalk::Search;
use Mojo::Base 'Mojolicious::Controller';

sub result
{
    my $self = shift;
    my $str  = $self->param( 'q' );
    my $ua  = Mojo::UserAgent->new;
    my $dom = $ua->get( 'http://habrahabr.ru/search/?q='.$str )->res->dom;
    my $pull = ();
    for my $raw ( $dom->find( 'div[id^="post"]' )->each ) {
        my $header= $raw->find( 'a[class="post_title"]' )->first;
        push @$pull, {
            title => $header->text,
            url => $header->{href},
            content => $raw->find( 'div[class^="content"]' )->first->text
        };
    }
    $self->render( result => $pull );
}

1;
