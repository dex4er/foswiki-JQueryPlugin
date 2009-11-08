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

package Foswiki::Plugins::JQueryPlugin::SUPERSUBS;
use strict;
use base 'Foswiki::Plugins::JQueryPlugin::Plugin';

=begin TML

---+ package Foswiki::Plugins::JQueryPlugin::SUPERSUBS

This is the perl stub for the jquery.supersubs plugin.

=cut

=begin TML

---++ ClassMethod new( $class, $session, ... )

Constructor

=cut

sub new {
  my $class = shift;
  my $session = shift || $Foswiki::Plugins::SESSION;

  my $this = bless($class->SUPER::new( 
    $session,
    name => 'Supersubs',
    version => '0.2b',
    author => 'Joel Birch',
    homepage => 'http://users.tpg.com.au/j_birch/plugins/superfish/#sample5',
    javascript => ['jquery.supersubs.js'],
    dependencies => ['superfish'], 
  ), $class);

  $this->{summary} = <<'HERE';
This is a companion plugin to superfish. It resizes superfish submenus to fit their contents.

HERE

  return $this;
}

1;