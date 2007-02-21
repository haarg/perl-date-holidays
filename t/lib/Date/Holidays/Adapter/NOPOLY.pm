package Date::Holidays::Adapter::NOPOLY;

# $Id: NOPOLY.pm 1732 2007-02-21 19:09:59Z jonasbn $

use strict;
use warnings;

use base 'Date::Holidays::Adapter';

use vars qw($VERSION);

$VERSION = '0.01';

sub holidays {
    my ($self, %params) = @_;

    my $dh = $self->{_adaptee}->new();

    if ($dh) {
        return $dh->nopoly_holidays(year => $params{'year'});
    } else {
        return;    
    }
}

sub is_holiday {
    my ($self, %params) = @_;

    my $dh = $self->{_adaptee}->new();

    if ($dh) {
        return $dh->is_nopoly_holiday(year => $params{'year'}, month => $params{'month'}, day => $params{'day'});
    } else {
        return;    
    }
}