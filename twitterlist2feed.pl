#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

use Config::IniFiles;
use Date::Parse;
use DateTime;
use HTML::Entities;
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

    $feed->title(sprintf 'Twitter List: %s/%s', $owner_screen_name, $slug);

    foreach my $st (@$statuses) {
        foreach my $media (@{$st->{extended_entities}{media}}) {
            my $e = XML::Feed::Entry->new;

            $e->author($st->{user}{screen_name});
            $e->link($media->{expanded_url});

            my $ctime = str2time($st->{created_at});
            $e->modified(DateTime->from_epoch(epoch => $ctime));

            my $content = XML::Feed::Content->new({
                body => '<img alt="" src="' . encode_entities($media->{media_url_https}) . '"/>',
                type => 'text/html',
            });
            $e->content($content);

            $content = XML::Feed::Content->new({
                body => $st->{text},
                type => 'text/plain',
            });
            $e->summary($content);
            $e->title($st->{text});
        }
    }

    print $feed->as_xml;
} while (0);

__END__
