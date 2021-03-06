// Generated by CoffeeScript 2.0.0-beta7
void function () {
  var cache$, escodegen, Program, randomBool, randomElement, randomFormat, randomInt, randomLineTerminator, randomWhitespace, render, renderForComparison, RoundtripFailureError;
  escodegen = require('escodegen');
  cache$ = require('./random');
  randomElement = cache$.randomElement;
  randomInt = cache$.randomInt;
  randomBool = cache$.randomBool;
  randomWhitespace = cache$.randomWhitespace;
  randomLineTerminator = cache$.randomLineTerminator;
  Program = require('./nodes/Program');
  RoundtripFailureError = function (super$) {
    extends$(RoundtripFailureError, super$);
    RoundtripFailureError.prototype.name = 'RoundtripFailureError';
    function RoundtripFailureError(param$) {
      this.message = param$;
      Error.call(this);
      if ('function' === typeof Error.captureStackTrace)
        Error.captureStackTrace(this, RoundtripFailureError);
    }
    return RoundtripFailureError;
  }(Error);
  randomFormat = function () {
    return {
      indent: {
        style: randomWhitespace(),
        base: randomInt(2)
      },
      quotes: randomElement([
        'auto',
        'double',
        'single'
      ]),
      escapeless: randomBool(),
      compact: randomBool(),
      parentheses: randomBool(),
      semicolons: randomBool()
    };
  };
  exports.generate = function (options) {
    if (null == options)
      options = {};
    return Program(null != options.maxDepth ? options.maxDepth : 7);
  };
  exports.render = render = function (programAST, format) {
    if (null == format)
      format = randomFormat();
    return escodegen.generate(programAST, {
      verbatim: 'raw',
      format: format
    });
  };
  renderForComparison = function (programAST) {
    return escodegen.generate(programAST, { format: escodegen.FORMAT_MINIFY });
  };
  exports.fuzzAndRoundtrip = function (programAST, parsers) {
    var err, format, program, roundTrippedProgram, roundTrippedPrograms, targetProgram;
    format = randomFormat();
    try {
      program = render(programAST, format);
      roundTrippedPrograms = function (accum$) {
        var parser;
        for (var i$ = 0, length$ = parsers.length; i$ < length$; ++i$) {
          parser = parsers[i$];
          accum$.push(renderForComparison(parser.parse(program)));
        }
        return accum$;
      }.call(this, []);
      targetProgram = renderForComparison(programAST);
      for (var i$ = 0, length$ = roundTrippedPrograms.length; i$ < length$; ++i$) {
        roundTrippedProgram = roundTrippedPrograms[i$];
        if (!(roundTrippedProgram !== targetProgram))
          continue;
        throw new RoundtripFailureError;
      }
    } catch (e$) {
      err = e$;
      err.ast = programAST;
      err.js = program;
      err.format = format;
      throw err;
    }
  };
  exports.fuzz = function (programAST, parsers) {
    var err, format, parser, program;
    try {
      format = randomFormat();
      program = render(programAST, format);
      for (var i$ = 0, length$ = parsers.length; i$ < length$; ++i$) {
        parser = parsers[i$];
        parser.parse(program);
      }
    } catch (e$) {
      err = e$;
      err.ast = programAST;
      err.js = program;
      err.format = format;
      throw err;
    }
  };
  function isOwn$(o, p) {
    return {}.hasOwnProperty.call(o, p);
  }
  function extends$(child, parent) {
    for (var key in parent)
      if (isOwn$(parent, key))
        child[key] = parent[key];
    function ctor() {
      this.constructor = child;
    }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  }
}.call(this);
