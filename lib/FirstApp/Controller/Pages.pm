package FirstApp::Controller::Pages;
use Mojo::Base 'Mojolicious::Controller';

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
    $c->app->log->debug("Request from home");


    $c->render(template => 'pages/search_results');
  }


}

1;
