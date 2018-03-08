package Alien::igraph;

use strict;
use warnings;

use parent qw(Alien::Base);

sub inline_auto_include {
	return  [ 'igraph.h' ];
}

sub Inline {
	my ($self, $lang) = @_;

	if('C') {
		my $params = Alien::Base::Inline(@_);

		# Use static linking instead of dynamic linking. This works
		# better on some platforms. On macOS, to use dynamic linking,
		# the `install_name` of the library must be set, but since this
		# is the final path by default, linking to the `.dylib` under
		# `blib/` at test time does not work without using `@rpath`.
		if( $^O eq 'darwin' ) {
			$params->{MYEXTLIB} .= ' ' .
				join( " ",
					map { File::Spec->catfile(
						File::Spec->rel2abs(Alien::igraph->dist_dir),
						'lib',  $_ ) }
					qw(libigraph.a)
				);
			$params->{LIBS} =~ s/-ligraph//g;
		}
		return $params;
	}
}


1;

__END__
# ABSTRACT: Alien package for the igraph network analysis library

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 IGRAPH LICENSE

C<igraph> is licensed under the GNU General Public License version 2.

=head1 SEE ALSO

L<igraph|http://igraph.org/>

L<Repository information|http://project-renard.github.io/doc/development/repo/p5-Alien-igraph/>
