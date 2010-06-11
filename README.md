# Interceptor

Mad Max had one, and he was freaking awesome.

## Overview:

Interceptor allows you to wrap other objects, and intercept method calls, without changing the target objects code, or performing any hairy metaprogramming. You may use this library to perform these kinds of tasks:

* Modifying method arguments as they come in.
* Modify return values as they go out.
* Perform other tasks (such as logging) without sprinkling the code throughout the objects (typically unrelated) implementation.
* Call completely different methods depending on anything you want, I suppose.

You can think of this as a more explicit form of AOP, but unlike AOP, instead of being picked off by a sniper from 3000m away (and being very surprised about the whole thing), it's like the sniper has arrived at your house with your birthday cake and birthday present in order to convey his birthday wishes.

## Example:

Let's say as a Ruby programmer you picked up some Lua and decided that Lua's idea of starting an Array at 1 is _way_ better than starting an Array at 0, in a fit of blinding genius you decide to make a Ruby Array behave like a Lua one.

    lucky_numbers = [42, 666, 2012]
    
    lucky_numbers[0] # => 42
    lucky_numbers[1] # => 666
    lucky_numbers[2] # => 2012
    
    even_luckier_numbers = Interceptor.new(lucky_numbers)
    
    # intercept the [] method, and take 1 off the index passed in
    # so that our arrays become like lua arrays, kinda
    even_luckier_numbers.intercept(:[]) do |receiver, target, index|
      receiver[index-1]
    end
    
    even_luckier_numbers[1] # => 42
    even_luckier_numbers[2] # => 666
    even_luckier_numbers[3] # => 2012
    
The first two arguments to the block is a reference to the object passed to the Interceptor (in this case, a reference to ``lucky_numbers``), the second is a symbol of the method call (in this case, it is ``:[]``), and the remaining arguments are the arguments passed to the method call (in this case, ``1`` and ``2`` and ``3``).

## Patches:

What the hell is a patch?

## RubyGem?

Nope, how do you make those? I asked this guy called John and he told me to 'google it' or something.

## Mad Max:

Is freaking awesome, [here's proof](http://www.youtube.com/watch?v=nLCmcV4gC_0).

## Other Questions?

If you have any questions, shoot me a message on the github-o-sphere. I likely have no idea what you're talking about as I have no idea what I'm talking about most of the time.
