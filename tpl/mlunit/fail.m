function fail(msg, internal_call)
  %fail raises an error.
  %  The parameter internal_call is used to trim the top entries of the
  %  stack trace, e.g. for user-defined assert methods (see the code of
  %  assert_equals for an example).
  %
  %  Example: fail('Test failed.');

  %  This Software and all associated files are released unter the
  %  GNU General Public License (GPL), see LICENSE for details.
  %
  %  §Author: Thomas Dohmke <thomas@dohmke.de> §
  %  $Id: fail.m 321 2008-03-29 13:26:46Z thomi $

  if (nargin == 0)
    msg = 'no message.';
    internal_call = 0;
  end;
  if (nargin == 1)
    internal_call = 0;
  end;
  if (internal_call > 1)
    internal_call = 1;
  end;

  error('MLUNIT:AssertionError',msg);
