# This script writes the Makefile for Money::ChangeMaker
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
require 5.004;
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'Money::ChangeMaker',
    'VERSION_FROM' => 'ChangeMaker.pm', # finds $VERSION
    'dist'        => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
		'PM' => {
			'ChangeMaker.pm' => '$(INST_LIBDIR)/ChangeMaker.pm',
			'Denomination.pm' => '$(INST_LIBDIR)/ChangeMaker/Denomination.pm',
			'Presets.pm' => '$(INST_LIBDIR)/ChangeMaker/Presets.pm',
		},
		'MAN3PODS' => {
			'ChangeMaker.pm' => '${INST_MAN3DIR}/Money::ChangeMaker.3',
			'Denomination.pm' => '${INST_MAN3DIR}/Money::ChangeMaker::Denomination.3',
			'Presets.pm' => '${INST_MAN3DIR}/Money::ChangeMaker::Presets.3',
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
