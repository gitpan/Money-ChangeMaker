# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..25\n"; }
END {print "not ok 1\n" unless $loaded;}
use Money::ChangeMaker;
use Money::ChangeMaker::Denomination;
use Money::ChangeMaker::Presets;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

sub ok { unless (shift()) { print "not "; } print "ok " . shift() . "\n" }

# General tests & test of US currency
ok( defined($cm = new Money::ChangeMaker()), 2);
ok( scalar(@ret = $cm->make_change(1521, 2000)) == 11, 3);
ok( $ret[0]->value == 100, 4);
ok( $ret[4]->name eq 'quarter', 5);
ok( $ret[8]->plural eq 'pennies', 6);
ok( $cm->as_string(@ret) eq "4 dollar bills, 3 quarters and 4 pennies", 7);
ok( scalar $cm->make_change(1521, 2000) eq "4 dollar bills, 3 quarters and 4 pennies", 8);

# India test
ok( defined($denom = $cm->get_preset("India")), 9);
ok( $cm->denominations($denom), 10);
ok( scalar(@ret = $cm->make_change(256.75, 300)) == 5, 11);
ok( $ret[3]->value == 1, 12);
ok( $ret[4]->value == 0.25, 13);
ok( $ret[0]->name eq 'twenty rupee note', 14);

# Canada test
ok( defined($denom = $cm->get_preset("Canada")), 15);
ok( $cm->denominations($denom), 16);
ok( scalar(@ret = $cm->make_change(25612, 30000)) == 11, 17);
ok( $ret[9]->value == 1, 18);
ok( $ret[2]->name eq 'two dollar coin', 19);

# UK test
ok( defined($denom = $cm->get_preset("UK")), 20);
ok( $cm->denominations($denom), 21);
ok( scalar(@ret = $cm->make_change(2428, 4001)) == 6, 22);
ok( $ret[2]->value == 50, 23);
ok( $ret[4]->name eq 'two pence coin', 24);
ok( $ret[5]->plural eq 'pence', 25);
