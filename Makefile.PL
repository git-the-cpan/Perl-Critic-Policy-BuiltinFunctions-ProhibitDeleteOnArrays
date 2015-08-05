
use strict;
use warnings;

use 5.006001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Do not use\nC<delete> on arrays.",
  "AUTHOR" => "liosha <liosha\@yandex-team.ru>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0,
    "Test::Perl::Critic::Policy" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Perl-Critic-Policy-BuiltinFunctions-ProhibitDeleteOnArrays",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Perl::Critic::Policy::BuiltinFunctions::ProhibitDeleteOnArrays",
  "PREREQ_PM" => {
    "Perl::Critic::Policy" => 0,
    "Perl::Critic::Utils" => 0,
    "Readonly" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
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



