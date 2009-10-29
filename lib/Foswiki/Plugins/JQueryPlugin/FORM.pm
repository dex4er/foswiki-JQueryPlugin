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

package Foswiki::Plugins::JQueryPlugin::FORM;
use strict;
use base 'Foswiki::Plugins::JQueryPlugin::Plugin';

=begin TML

---+ package Foswiki::Plugins::JQueryPlugin::FORM

This is the perl stub for the jquery.form plugin.

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
    name => 'Form',
    version => '2.25',
    author => 'M. Alsup',
    homepage => 'http://malsup.com/jquery/form',
    javascript => ['jquery.form.js'],
  ), $class);

  $this->{summary} = <<'HERE';
The jQuery Form Plugin allows you to easily and unobtrusively upgrade HTML
forms to use AJAX. The main methods, ajaxForm and ajaxSubmit, gather
information from the form element to determine how to manage the submit
process. Both of these methods support numerous options which allows you to
have full control over how the data is submitted. Submitting a form with AJAX
doesn't get any easier than this!
HERE

  return $this;
}

1;
