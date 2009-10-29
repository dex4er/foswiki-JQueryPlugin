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

package Foswiki::Plugins::JQueryPlugin::RATING;
use strict;

use base 'Foswiki::Plugins::JQueryPlugin::Plugin';

=begin TML

---+ package Foswiki::Plugins::JQueryPlugin::RATING

This is the perl stub for the jquery star rating plugin.

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
    name => 'Rating',
    version => '3.12',
    author => 'Diego A. (Fyneworks.com)',
    homepage => 'http://jquery-star-rating-plugin.googlecode.com/svn/trunk/index.html',
    css => ['jquery.rating.css'],
    javascript => ['jquery.rating.js'],
  ), $class);


  $this->{summary} = <<'HERE';
The Star Rating Plugin is a plugin for the jQuery Javascript library that
creates a non-obstrusive star rating control based on a set of radio input
boxes.

It turns a collection of radio boxes into a neat star-rating control.  It
creates the interface based on standard form elements, which means the basic
functionality will still be available even if Javascript is disabled.
HERE

  return $this;
}

1;