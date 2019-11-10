package FirstApp::Controller::Pages;
use Mojo::Base 'Mojolicious::Controller';
use HTTP::Request::JSON;
use LWP::UserAgent::JSON;
use JSON::PP;
use Data::Dumper;

# This action will render a template
sub pages {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  sub home {
    my $c = shift;
  $c->render(msg => 'Welcome to the Mojolicious real-time web framework!');
  };

  sub search {
    my $c = shift;
    my $data = $c->param('home_search_input');
    # $c->app->log->debug(Dumper($data));
    my $url = "https://api.themoviedb.org/3/search/multi?api_key=d9dc74db8674de37e88f719c23adce45&language=en-US&query=$data";
    my $header = ['Content-Type' => 'application/json; charset=UTF-8'];

    my $r = HTTP::Request::JSON->new('GET', $url, $header);
    my $ua = LWP::UserAgent::JSON->new(
      ssl_opts => { verify_hostname => 0 },
      protocols_allowed => ['https'],
    );
    my $res = $ua->request($r);
    $c->app->log->debug(Dumper($res->content));
    my $result = $res->content;
    my $json = decode_json($result);
    # my $json_file = 'search.json';
    # open(my $fh, '>', $json_file) or die "couldnt open $json_file \n";
    # print $fh $res->content;
    # close($fh);
    $c->stash(result => $json);
    $c->render(template => 'pages/search_results');
  }


}

1;
