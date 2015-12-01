package App::BlogAlba::Publisher;

use strict;
use warnings;

use Carp;

use Text::Markdown::Hoedown;
use YAML;

use POSIX qw/strftime/;
use Date::Parse qw/str2time/;

use Unicode::Normalize;

=head1 NAME

App::BlogAlba::Publisher

=head1 VERSION

Version 0.1

=cut

our $VERSION = '0.1';

use Exporter::Easy (
	EXPORT => [ qw// ],
	OK     => [ qw/ParseArticle, ParseArticles/ ],
);

=head1 SYNOPSIS

Allows a fairly genericised "load files from given path with given regexp and turn them into a data structure" setup.

		use App::BlogAlba::Publisher;
		my @articles = ParseArticles('/your/path','^.*\.md$');

=head1 TERMINOLOGY

=head2 Article

In the context of this module, an "article" is any valid markdown document which contains a YAML preamble, of the format:

		---
		YAML
		---
		
		MARKDOWN

=cut

sub FindArticles {
	my ($path,$regexp) = @_;
	opendir ARTICLES, $path or carp "Couldn't open path '$path'!" and return undef;
	my @articles;
	while(readdir ARTICLES) {
		push @articles, "$path/$_" if /$regexp/;
	}
	closedir ARTICLES;
	return @articles;
}

=head1 SUBROUTINES

=head2 ParseArticle

Allows a single file to be parsed. Returns a hashref of the resulting data structure.
Requires one argument, the path to a valid article.

		my $article = ParseArticle('/path/to/your/article.md');

=cut

sub ParseArticle {
	my $file = shift;
	return {};
}

=head2 ParseArticles

A wrapper around ParseArticle() for parsing all articles in a directory. Uses FindArticles() internally for retrieving the list of articles within the directory.
Requires two arguments; the path to a directory containing articles, and a regular expression with which to compare filenames against.

=cut

sub ParseArticles {
	my @articles = FindArticles @_;
	my @parsed_articles;
	push @parsed_articles, ParseArticle $_ for @articles;
}

1;
__END__
