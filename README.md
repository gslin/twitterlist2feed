[![Build Status](https://travis-ci.org/gslin/twitterlist2feed.svg?branch=master)](https://travis-ci.org/gslin/twitterlist2feed)

# twitterlist2feed

Export all media (photos) of a Twitter list into another Atom feed.

Pre-requirement
---------------

Install these modules:

    Config::IniFiles
    Date::Parse
    DateTime
    HTML::Entities
    Net::Twitter
    XML::Feed

With [cpanm](https://github.com/miyagawa/cpanminus):

    cpanm -n Config::IniFiles Date::Parse DateTime HTML::Entities Net::Twitter XML::Feed

Setup
-----

In `~/.config/twitterlist2feed/config.ini`:

    [default]
    consumer_key = x
    consumer_secret = x
    access_token = x
    access_token_secret = x

Usage
-----

    bin/twitterlist2feed.pl [screenname] [listname]

Example
-------

To access https://twitter.com/gslin/lists/fj:

    bin/twitterlist2feed.pl gslin fj

License
-------

See `LICENSE` file.
