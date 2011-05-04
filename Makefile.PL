
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Process payments through JSON API of Suomen Verkkomaksut in Finland. Enables payments from all Finnish Banks online: Nordea, Osuuspankki, Sampo, Tapiola, Aktia, Nooa, Paikallisosuuspankit, Säästöpankit, Handelsbanken, S-Pankki, Ålandsbanken, also from Visa, Visa Electron, MasterCard credit cards through Luottokunta, and PayPal, billing through Collector and Klarna.',
  'AUTHOR' => 'Oskari Okko Ojala <okko@cpan.org>, Frantic Oy http://www.frantic.com/',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Finance-Bank-SuomenVerkkomaksut',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Finance::Bank::SuomenVerkkomaksut',
  'PREREQ_PM' => {
    'Data::Dumper' => '0',
    'Digest::MD5' => '0',
    'JSON::XS' => '0',
    'Moose' => '0',
    'Net::SSLeay' => '0',
    'utf8' => '0'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



