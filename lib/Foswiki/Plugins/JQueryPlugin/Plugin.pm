# Plugin for Foswiki - The Free and Open Source Wiki, http://foswiki.org/
#
# Copyright (C) 2006-2009 Michael Daum, http://michaeldaumconsulting.com
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version. 
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details, published at
# http://www.gnu.org/copyleft/gpl.html

package Foswiki::Plugins::JQueryPlugin::Plugin;

use Foswiki::Plugins::JQueryPlugin::Plugins ();

use strict;

=begin TML

---+ package Foswiki::Plugins::JQueryPlugin::Plugin

abstract class for a jQuery plugin

=cut

=begin TML

---++ ClassMethod new( $class, $session, ... )

   * =$class=: Plugin class
   * =$session= : Foswiki object, defaults to =$Foswiki::Plugins::SESSION=
   * =...=: additional properties to be added to the object. i.e. 
      * =name => 'pluginName'= (default unknown)
      * =author => 'pluginAuthor'= (default unknown)
      * =version => 'pluginVersion'= (default unknown)
      * =summary => 'pluginSummary'= (default unknown)
      * =homepage => 'pluginHomepage'= (default unknown)
      * =debug => 0 or 1= (default =$Foswiki::cfg{JQueryPlugin}{Debug}=)

=cut

sub new {
  my $class = shift;
  my $session = shift || $Foswiki::Plugins::SESSION;

  my $this = bless({
    session => $session,
    debug => $Foswiki::cfg{JQueryPlugin}{Debug} || 0,
    name => $class,
    author => 'unknown',
    version => 'unknown',
    summary => 'unknown',
    homepage => 'unknown',
    puburl => '',
    css => [],
    javascript => [],
    dependencies => [],
    tags => '',
    @_
  }, $class);

  unless ($this->{puburl}) {
    $this->{puburl} = 
      '%PUBURLPATH%/%SYSTEMWEB%/JQueryPlugin/plugins/'.
      lc($this->{name});
  }

  return $this;
}

=begin TML

---++ ClassMethod init()

add jQuery plugin to web and make sure all its dependencies 
are fulfilled

=cut

sub init {
  my $this = shift;

  return 0 if $this->{isInit};
  $this->{isInit} = 1;

  my $header = '';

  # load all css
  foreach my $css (@{$this->{css}}) {
    $css =~ s/\.css$/.uncompressed.css/ if $this->{debug};
    $css .= '?version='.$this->{version};
    $header .= <<"HERE";
<link rel='stylesheet' href='$this->{puburl}/$css' type='text/css' media='all' />
HERE
  }

  # load all javascript
  foreach my $js (@{$this->{javascript}}) {
    $js =~ s/\.js$/.uncompressed.js/ if $this->{debug};
    $js .= '?version='.$this->{version};
    $header .= <<"HERE";
<script type='text/javascript' src='$this->{puburl}/$js'></script>
HERE
  }

  # dependencies
  my @headerDependency = ('JQUERYPLUGIN::FOSWIKI'); # jquery.foswiki is in there by default
  foreach my $dep (@{$this->{dependencies}}) {
    if ($dep =~ /^JQUERYPLUGIN/) {
      push @headerDependency, $dep;
    } else {
      Foswiki::Plugins::JQueryPlugin::Plugins::createPlugin($dep);
      push @headerDependency, 'JQUERYPLUGIN::'.uc($this->{name});
    }
  }

  Foswiki::Func::addToHEAD("JQUERYPLUGIN::".uc($this->{name}), "\n".$header, join(', ', @headerDependency));

  return 1;
}

1;