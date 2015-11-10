function assert(expr, msg, internal_call)
  %assert checks whether the expr is true or not and raises an error if not.
  %  A common call to assert looks like this:
  %         Example: assert(a == b);
  %  The assertion will fail, if a is not equal to b.
  %
  %  In addition, a message can be specified:
  %         Example: assert(a == b, 'a is not equal to b.');
  %  The message is only used, if the assertion fails.
  %
  %  The parameter internal_call is used to trim the top entries of the stack
  %  trace, e.g. for user-defined assert methods (see the code of
  %  assert_equals for an example).

  %  This Software and all associated files are released unter the
  %  GNU General Public License (GPL), see LICENSE for details.
  %
  %  §Author: Thomas Dohmke <thomas@dohmke.de> §
  %  $Id: assert.m 346 2008-04-05 10:49:30Z thomi $

  if (nargin == 1)
    msg = 'no message.';
    internal_call = 0;
  end;
  if (nargin == 2)
    internal_call = 0;
  end;
  if (internal_call > 1)
    internal_call = 1;
  end;
  if ((isempty(expr)) || (~expr))
    try
      error('MLUNIT:AssertionError',msg);
    catch failed
      Cause = MException('MLUNIT:AssertionError','Assertion failed - equation evaluated to false.');
      failed = failed.addCause(Cause);
      throw(failed);
    end
  end;
