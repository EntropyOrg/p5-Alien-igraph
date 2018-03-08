package Alien::igraph;

use strict;
use warnings;

use parent qw(Alien::Base);

sub inline_auto_include {
	return  [ 'igraph.h' ];
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
