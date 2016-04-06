# Post Tag System Simulator

This is a simple Haskell program to trace through the steps of a [Post Tag
System][post-tag], a powerful form of rewrite systems. It's useful for gaining
intuition about how these rewrite systems work, especially when [asked to prove
things about them][hw05].

## Usage

**This usage information may become out of date.** Run the program with no
arguments or check the source for more up-to-date information if something
doesn't seem to work.

```
Usage:
  post [options] (small|big) <iterations> <word>

Options:
  --intersperse  Intersperse <word> with 0's (because only evens will be read)
```

Note that the tag system can only be configured by editing the code, so you'll
have to compile it yourself if you really want to play around.


## Step Semantics

There are two forms of step semantics; "small" steps or "big" steps. Small steps
perform one deletion+append combo at a time, and big steps replace the entire
string in one step, deleting many characters at a time. I'm not sure which
flavor helps to think about the problem best.


## Installation

Installation instructions should be standard Haskell instructions, but this is
my first Haskell project so I might have done something wrong.

```
git clone https://github.com/jez/flac-post-tag
cabal sandbox init
cabal install
cabal build
```

You can also check the Releases for binaries.


## License

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](https://jez.io/MIT-LICENSE.txt)

[post-tag]: http://www.cs.cmu.edu/~flac/PDFs/Rewrite.pdf
[hw05]: http://www.cs.cmu.edu/~flac/PDFs/hw05.pdf
