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

    ./twitterlist2feed.pl [screenname] [listname]

Example
-------

To access https://twitter.com/gslin/lists/fj:

    ./twitterlist2feed.pl gslin fj
