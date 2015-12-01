package App::BlogAlba;

use strict;
use warnings;

use 5.010;

use App::BlogAlba::Publisher;

use Data::Paginated;

use Dancer2;
use Dancer2::Plugin::Feed;

our $VERSION = '0.95';

my $postsdir = Dancer2::FileUtils::path(
	setting('appdir'), 'published', 'posts'
);
die "Posts directory $postsdir does not exist!" unless -e -d $postsdir;
my $pagesdir = Dancer2::FileUtils::path(
	setting('appdir'), 'published', 'pages'
);
$pagesdir = undef unless -e -d $pagesdir;

my (@posts,@pages);
my ($cachetime,$cachedelta);

sub ValidParams {
	return 1;
}
sub Cache {
	#
}
sub Initialise {
	#
}

get '/' => sub {
}

get '/page/:num' => sub {
}

get '/:page' => sub {
}

get '/feed/:type' => sub {
	pass unless params->{type} =~ /^(rss|atom)$/i;
	create_feed
		format => lc params->{type},
		title => config->{blogtitle},
		link => request->base,
		entries => \@entries;
}

get '/wrote/:year/:month/:slug' => sub {
	pass unless ValidParams scalar params 'route';
	
}

1;
__END__
