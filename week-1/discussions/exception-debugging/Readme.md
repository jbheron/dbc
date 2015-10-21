# Debugging Ruby

##Exceptions

### readings/tutorials:
- [ruby exceptions](http://rubylearning.com/satishtalim/ruby_exceptions.html)
- [exception handling](http://ruby.bastardsbook.com/chapters/exception-handling/)
- [ruby docs](http://www.ruby-doc.org/core-2.1.0/Exception.html)

## Stack Trace

### readings/tutorials:
- [how to read ruby errors](http://modernlegend.github.io/blog/2013/02/28/how-to-read-ruby-errors/)
- [railscasts stack trace](http://railscasts.com/episodes/24-the-stack-trace?view=asciicast)


## Debugger Gem
[brief explanation](http://rubyforge.org/docman/view.php/8883/10451/ruby-debug.html#Summary)

### installation:
```bash
gem install debugger
```
or in you Gemfile:
```ruby
gem 'debugger'
```

[installation guide](https://github.com/cldwalker/debugger#install)

### settings:
Mainly focus on these two settings:

- [set autoeval](http://bashdb.sourceforge.net/ruby-debug.html#Autoeval)
- [set autolist](http://bashdb.sourceforge.net/ruby-debug.html#Autolist)

For a full list, read the [config guide](http://bashdb.sourceforge.net/ruby-debug.html#ruby_002ddebug-settings) (be curious, go skim it).

You can use these settings in two distinct ways:

- type them everytime you debug: when you're in debugger mode, you can simply type: set autoeval and set autolist.
- automatically do it: create a .rdebugrc file under your user root and add both commands to it.

### usage:

The main usage that you need to focus on:

- [n[ext]](http://bashdb.sourceforge.net/ruby-debug.html#Next)
- [c[ontinue]](http://bashdb.sourceforge.net/ruby-debug.html#Continue)
- [s[tep]](http://bashdb.sourceforge.net/ruby-debug.html#Step)
- [fin[ish]](http://bashdb.sourceforge.net/ruby-debug.html#Finish)
- [h[elp]](http://bashdb.sourceforge.net/ruby-debug.html#Help)

### readings/tutorials:
- [ruby debug in 30 seconds](http://pivotallabs.com/ruby-debug-in-30-seconds-we-don-t-need-no-stinkin-gui/)
-
