use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    license           => 'MIT',
    dist_abstract     => 'Export all media (photos) of a Twitter list into another Atom feed.',
    dist_author       => 'Gea-Suan Lin <gslin@gslin.org>',
    dist_name         => 'Twitterlist2Feed',
    dist_version_from => 'bin/twitterlist2feed.pl',
    requires          => {
        'Config::IniFiles' => '0',
        'Date::Parse' => '0',
        'DateTime' => '0',
        'HTML::Entities' => '0',
        'Net::Twitter' => '0',
        'XML::Feed' => '0',
    },
);

$builder->create_build_script();
