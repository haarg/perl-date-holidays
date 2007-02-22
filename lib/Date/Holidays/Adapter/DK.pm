package Date::Holidays::Adapter::DK;

# $Id: DK.pm 1742 2007-02-22 19:47:55Z jonasbn $

use strict;
use warnings;
use vars qw($VERSION);

use base 'Date::Holidays::Adapter';

$VERSION = '0.01';

sub holidays {
    my ($self, %params) = @_;

    my $sub = $self->{_adaptee}->can('dk_holidays');    

    if ($sub) {
        return &{$sub}($params{'year'});
    } else {
        return;    
    }
}

sub is_holiday {
    my ($self, %params) = @_;
    
    my $sub = $self->{_adaptee}->can('is_dk_holiday');

    if ($sub) {
        return &{$sub}($params{'year'}, $params{'month'}, $params{'day'});
    } else {
        return;    
    } 
}

1;

__END__

=head1 NAME

Date::Holidays::Adapter::DK - an adapter class for Date::Holidays::DK

=head1 VERSION

This POD describes version 0.01 of Date::Holidays::Adapter::DK

=head1 DESCRIPTION

The is the adapter class for L<Date::Holidays::DK>.

=head1 SUBROUTINES/METHODS

=head2 new

The constructor, takes a single named argument, B<countrycode>

=head2 is_holiday

The B<holidays> method, takes 3 named arguments, B<year>, B<month> and B<day>

Returns an indication of whether the day is a holiday in the calendar of the
country referenced by B<countrycode> in the call to the constructor B<new>.

=head2 holidays

The B<holidays> method, takes a single named argument, B<year>

Returns a reference to a hash holding the calendar of the country referenced by
B<countrycode> in the call to the constructor B<new>.

The calendar will spand for a year and the keys consist of B<month> and B<day>
concatenated.

=head1 DIAGNOSTICS

=over

=item * L<Date::Holidays::Exception::AdapterLoad>

This exception is thrown when L<Date::Holidays::Adapter> attempts to load an
actual adapter implementation. This exception is recoverable to the extend
that is caught and handled internally.

When caught the SUPER adapter is attempted loaded, L<Date::Holidays::Adapter>
if this however fails L<Date::Holidays::Exception::SuperAdapterLoad> it thrown
see below.

=item * L<Date::Holidays::Exception::AdapterInitialization>

This exception is thrown when in was not possible to load either a
implementation of a given adapter, or the SUPER adapter
L<Date::Holidays::Adapter>.

=item * L<Date::Holidays::Exception::NoCountrySpecified>

The exception is thrown if a country code is provided, which is not listed
in L<Locale::Country>, which lists ISO 3166 codes, which is the unique 2
character strings assigned to each country in the world.

=item * L<Date::Holidays::Exception::UnsupportedMethod>

Exception thrown in the case where the loaded and initialized module does not
support the called method. (SEE: METHODS/SUBROUTINES).

=back

=head1 DEPENDENCIES

=over

=item * L<Date::Holidays::DK>

=item * L<Date::Holidays::Adapter>

=item * L<Date::Holidays::Exception::UnsupportedMethod>

=item * L<Date::Holidays::Exception::InvalidCountryCode>

=item * L<Date::Holidays::Exception::NoCountrySpecified>

=item * L<Date::Holidays::Exception::UnsupportedMethod>

=item * L<Error>

=item * L<UNIVERSAL>

=back

=head1 INCOMPATIBILITIES

Please refer to INCOMPATIBILITIES in L<Date::Holidays>

=head1 BUGS AND LIMITATIONS

Please refer to BUGS AND LIMITATIONS in L<Date::Holidays>

=head1 BUG REPORTING

Please report issues via CPAN RT:

  http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Holidays

or by sending mail to

  bug-Date-Holidays@rt.cpan.org

=head1 AUTHOR

Jonas B. Nielsen, (jonasbn) - C<< <jonasbn@cpan.org> >>

=head1 LICENSE AND COPYRIGHT

L<Date::Holidays> and related modules are (C) by Jonas B. Nielsen, (jonasbn)
2004-2007

L<Date::Holidays> and related modules are released under the artistic license

The distribution is licensed under the Artistic License, as specified
by the Artistic file in the standard perl distribution
(http://www.perl.com/language/misc/Artistic.html).

=cut