# This script writes the Makefile for Money::ChangeMaker
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
require 5.004;
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	       => 'Money::ChangeMaker',
    'VERSION_FROM' => 'lib/Money/ChangeMaker.pm', # finds $VERSION
    'dist'         => {
			COMPRESS => 'gzip -9f',
			SUFFIX => 'gz',
		},
);

package MY;

sub libscan
{ # Determine things that should *not* be installed
    my($self, $path) = @_;
    return '' if $path =~ m/~/;
    $path;
}

__END__
