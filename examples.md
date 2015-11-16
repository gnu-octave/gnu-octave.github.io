---
layout: page
title: Examples
permalink: /examples/
menu: true
---

### Using Octave 

First, follow the [installation guide]({{ site.baseurl/install/ }}) to install Octave on your system. Then, launch the interactive prompt by typing `octave` in a terminal or by clicking the icon in the programs menu. For further guidance, see the manual page on [Running Octave]({{site.docs_url}}Running-Octave.html).

### Language Basics

Click the headings below to see a manual page related to each topic
{: .panel}

###### [Variable Assignment]({{site.docs_url}}Variables.html)

Assign values to variables with `=` (Note: assignment is <a href="#" data-reveal-id="assignmentModal">pass-by-value</a>)

###### [Comments]({{site.docs_url}}Comments.html)

`%` starts a comment block that continues to the end of the line.

###### [Evaluation]({{site.docs_url}}Simple-Examples.html)

The output of every command is printed to the console unless terminated with `;`. The `disp()` command can be used to print output anywhere. Use `exit` to quit the console.

{% highlight matlab %}
t = 99 + 1  % prints 't = 100'
t = 99 + 1; % nothing is printed
disp(t);
  100
{% endhighlight %}

###### [Math]({{site.docs_url}}Arithmetic.html)

Many mathematical operators are available in addition to the standard arithmetic. Operations are floating-point.
{% highlight matlab %}
x = 3/4*pi;
y = sin(x)
  0.70711
{% endhighlight %}

###### [Matrices]({{site.docs_url}}Matrices.html)

Arrays in Octave are called matrices. One-dimensional matrices are referred to as vectors. Use `space` or `,` to separate elements and `;` to start a new row.

{% highlight matlab %}
rowVec = [8 6 4]
  8   6   4   
columnVec = [8; 6; 4]
  8
  6
  4
mat = [8 6 4; 2 0 -2]
  8   6   4
  2   0  -2
size(mat)
  2   3
length(rowVec)
  3
{% endhighlight %}

###### [Linear Algebra]({{site.docs_url}}Linear-Algebra.html)

Many common linear algebra operations are simple to program using Octave's matrix syntax.

{% highlight matlab %}
columnVec * rowVec
  64   48   32
  48   36   24
  32   24   16
rowVec * columnVec
  116
columnVec'
  8   6   4
{% endhighlight %}

###### [Accessing Elements]({{site.docs_url}}Index-Expressions.html)

Octave is 1-indexed. Matrix elements are accessed as `matrix(rowNum, columnNum)`.

{% highlight matlab %}
mat(2,3)
  -2
{% endhighlight %}

###### [Iteration]({{site.docs_url}}Statements.html)

Octave supports `for` and `while` loops, as well as other control flow structures.

{% highlight matlab %}
x = zeros(50,1);
for i=1:2:100 % iterate from 1 to 100 with step size 2
  x(i) = i^2;
end

y = zeros(50,1);
k = 1;
step = 2;
while k<=(100-step)
  y(i) = k^2;
  k = k + step;
end
{% endhighlight %}

###### [Vectorization]({{site.docs_url}}Vectorization-and-Faster-Code-Execution.html)

For-loops can often be replaced or simplified using vector syntax. The operators `*`,`/`,`^`,`%` all support element-wise operations using `.`. Many other functions operate element-wise by default (`sin`,`+`,`-`, etc.).

{% highlight matlab %}
i = 1:2:100;   % create a 50-element array
x = i.^2;      % each element is squared
y = x + 9;     % add 9 to each element
z = y./i;      % divide each element in y by the corresponding value in i
w = sin(i/10); % take the sine of each element ÷ 10
{% endhighlight %}

###### [Plotting]({{site.docs_url}}Two_002dDimensional-Plots.html)

`plot` can be called with vector arguments to create 2D line and scatter plots.

{% highlight matlab %}
plot(w,i/10);
title('w = sin(i/10)';
xlabel('i ÷ 10');
ylabel('w');
{% endhighlight %}

<img src="{{site.baseurl}}/img/sinePlot.png" alt="sine plot" style="height: 20rem; width: auto;" />


###### [Strings]({{site.docs_url}}Strings.html)

Strings are simply arrays of characters. Strings can be composed using `printf`-style formatting with `sprintf` and `fprintf`.
{% highlight matlab %}
firstString = 'hello world';
secondString = '!';
[firstString,secondString]
  hello world!
fprintf('%s %.10f \n', 'The number is:', 10)
  The number is: 10.0000000000
{% endhighlight %}

###### [If-else]({{site.docs_url}}The-if-Statement.html)

Conditional statements can be used to create branching logic in your code.

{% highlight matlab %}
% Print 'Foo' if divisible by 7,
%       'Fizz' if divisible by 3,
%       'Buzz' if divisible by 5,
%       'FizzBuzz' if divisible by 3 and 5
for (i = 1:1:100)
  outputString = '';
  if (rem(i,3) == 0) % rem is the remainder function
    outputString = [outputString, 'Fizz'];
  end
  if (rem(i,5) == 0)
    outputString = [outputString, 'Buzz'];
  elseif (rem(i,7) == 0)
    outputString = 'Foo';
  else 
    outputString = outputString;
  end
  fprintf('i=%g: %s \n',i,outputString);
end
{% endhighlight %}

{% highlight text %}
  ...
  i=12: Fizz
  i=13:
  i=14: Foo
  i=15: FizzBuzz
  ...
{% endhighlight %}

###### [Help]({{site.docs_url}}Simple-Examples.html#Help-and-Documentation)

The `help` and `doc` commands can be invoked at the Octave prompt to print documentation for any function.

{% highlight matlab %}
help plot
doc plot
{% endhighlight %}

###### [Packages]({{site.docs_url}}Packages.html)

Community-developed packages can be added from the [Octave Forge](http://octave.sourceforge.net/index.html) to extend the functionality of Octave's core library. The `pkg` command is used to manage these packages. For example, to use the image processing library from the Forge, use:

{% highlight matlab %}
pkg install -forge image % install package
pkg load image           % load new functions into workspace
{% endhighlight %} 

<div id="assignmentModal" class="reveal-modal tiny" data-reveal aria-hidden="true" role="dialog">
{% highlight matlab %}
a = 1
b = a
b = 2
a == b % returns 0 (false)
{% endhighlight %}
<a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>
