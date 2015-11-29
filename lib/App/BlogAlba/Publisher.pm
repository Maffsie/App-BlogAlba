package App::BlogAlba::Publisher;

use strict;
use warnings;

use Text::Markdown::Hoedown;
use YAML;

use POSIX qw/strftime/;
use Date::Parse qw/str2time/;

use Unicode::Normalize;

use Exporter::Easy (
	EXPORT => [ qw// ],
	OK     => [ qw// ],
);

sub FindArticles {
	my ($path,$regexp) = @_;
	opendir ARTICLES, $path or return undef;
	my @articles;
	while(readdir ARTICLES) {
		push @articles, "$path/$_" if /$regexp/;
	}
	closedir ARTICLES;
	return @articles;
}
sub ParseArticles {
	
}

1;
__END__
