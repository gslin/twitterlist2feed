#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

use Config::IniFiles;
use Net::Twitter;
use XML::Feed;

do {
    die if !defined $ARGV[1];

    my $cnf = Config::IniFiles->new(-file => $ENV{HOME} . '/.config/twitterlist2feed/config.ini');
    my $nt = Net::Twitter->new(
        traits => [qw/API::RESTv1_1/],
        consumer_key => $cnf->val('default', 'consumer_key'),
        consumer_secret => $cnf->val('default', 'consumer_secret'),
        access_token => $cnf->val('default', 'access_token'),
        access_token_secret => $cnf->val('default', 'access_token_secret'),
    );

    my $owner_screen_name = $ARGV[0];
    my $slug = $ARGV[1];

    my $statuses = $nt->list_statuses({
        count => 100,
        include_rts => 'false',
        slug => $slug,
        owner_screen_name => $owner_screen_name,
    });

    my $feed = XML::Feed->new('Atom');
    print $feed->as_xml;
} while (0);

__END__
