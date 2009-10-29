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

package Foswiki::Plugins::JQueryPlugin::DEBUG;
use strict;

use base 'Foswiki::Plugins::JQueryPlugin::Plugin';

=begin TML

---+ package Foswiki::Plugins::JQueryPlugin::DEBUG

This is the perl stub for the jquery.debug plugin.

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
    name => 'Debug',
    version => '20080225',
    author => 'Stephane Lenclud',
    homepage => 'http://www.glyphix.com',
    css => ['jquery.debug.css'],
    javascript => ['jquery.debug.js'],
  ), $class);

  $this->{summary} = <<'HERE';
Simple jQuery logger / debugger using firebug's console or a div of its own of the form
<verbatim class="html">
<div id="DEBUG">
  <ol>
    <li>...</li>
    ...
  </ol>
</div>
</verbatim>

Usage:
   * =$.log("message");=: will send the message to the console
   * =$.log(object);=: will stringify the object 
   * =$("<selector>").debug();= will stringify the found objects
HERE

  return $this;
}

1;
