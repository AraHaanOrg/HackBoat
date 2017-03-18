defmodule Hackbot.Learn do
  use Alchemy.Cogs
  import Alchemy.Embed

  def auto_field_embed(title, information) do
    Enum.reduce(information, %Alchemy.Embed{}, fn {name, value}, embed ->
      field(embed, name, value)
    end)
    |> title(title)
  end

  def error_embed(error_message) do
      %Alchemy.Embed{}
      |> title(error_message)
      |> color(0xCC0000)
  end

  def make_embed(title, contents) do
    %Alchemy.Embed{}
    |> title(title)
    |> description(contents)
  end
  def make_embed(title, contents, thumbnail) do
    %Alchemy.Embed{}
    |> title(title)
    |> description(contents)
    |> image(thumbnail)
  end

  Cogs.def learn() do
    error_embed("No Language specified. Type `!learn all` to view all available Languages.")
    |> Cogs.send
  end

  Cogs.def learn("all") do
    all_languages = [
      {
        "**elixir**",
        "A dynamic, functional, compiled language designed for building scalable and maintainable applications. Runs on the Erlang VM, known for low-latency, distributed and fault-tolerant systems."
      },
      {
        "**python**",
        "An easy to learn, general-purpose, interpreted programming language with efficient high-level data structures and a simple but effective approach to OOP."
      }
    ]
    auto_field_embed("Available Learning Resources", all_languages)
    |> Cogs.send
  end
  Cogs.def learn("c++") do
    make_embed("Resources for C++", "
                **- GENERAL -**
                • **C++ Resource Network**: <http://www.cplusplus.com>
                • **Standard C++ Library Reference**: <http://www.cplusplus.com/reference/>
                • **Standard C++**: <https://isocpp.org>
                
                **- LEARNING -**
                • **LearnCpp**: <http://www.learncpp.com>
                • **C++ Language**: <http://www.cplusplus.com/doc/tutorial/>
                • **Programming: Principles and Practice using C++**: <https://ebooks-it.org/0321992784-ebook.htm>

                **- POPULAR LIBRARIES -**
                • **Boost** (general-purpose): <http://www.boost.org>
                • **SDL2** (multimedia): <http://libsdl.org>
                ", "https://github.com/jwkratz/cpp_logo/blob/master/cpp_logo_small.png")
    |> Cogs.send
  end

  Cogs.def learn("elixir") do
    make_embed("Resources for Elixir", "
                **- GENERAL -**
                • **Official Website**: <http://elixir-lang.org>
                • **Official Docs**: <http://elixir-lang.org/docs.html>

                **- LEARNING -**
                • **Elixir School**: <https://elixirschool.com>
                • **Introduction to Elixir**: <http://elixir-lang.org/getting-started/introduction.html>
                • **Code School - Elixir**: <https://www.codeschool.com/courses/try-elixir?utm_source=elixir_learning&utm_medium=referral>
                • **Learn Elixir in Y Minutes**: <https://learnxinyminutes.com/docs/elixir/>
                • **Other Resources**: <http://elixir-lang.org/learning.html>

                **- POPULAR LIBRARIES -**
                • **Alchemy** (discord library): <https://github.com/cronokirby/alchemy>
                • **Phoenix** (web framework): <http://www.phoenixframework.org>
                • **awesome-elixir** (collection of libraries): <https://github.com/h4cc/awesome-elixir>

                **- OTHER -**
                • **Repository**: <https://github.com/elixir-lang/elixir>
                • **Style Guide**: <https://github.com/christopheradams/elixir_style_guide>
                ", "https://raw.githubusercontent.com/elixir-lang/elixir-lang.github.com/master/images/logo/logo.png")
    |> Cogs.send
  end

  Cogs.def learn("python") do
    make_embed("Resources for Python", "
               **- GENERAL -**
               • **Official Website**: <https://www.python.org>
               • **Official Docs**: <https://docs.python.org/3/>

               **- LEARNING -**
               • **Oficial Tutorial**: <https://docs.python.org/3/tutorial/index.html>
               • **Interactive Python Tutorial**: <http://www.learnpython.org>
               • **Automate The Boring Stuff**: <http://automatetheboringstuff.com>
               • **A Byte of Python**: <https://python.swaroopch.com>
               • **Google's Python Class**: <https://developers.google.com/edu/python/>
               • **Learn Python in Y Minutes**: <https://learnxinyminutes.com/docs/python/>
               • **Other Resources**: <http://docs.python-guide.org/en/latest/intro/learning/>

               **- POPULAR LIBRARIES -**
               • **NumPy** (scientific computing): <https://github.com/numpy/numpy>
               • **Flask** (web development framework): <https://github.com/pallets/flask>
               • **Requests** (HTTP library): <http://www.python-requests.org/en/master/>
               • **pygame** (multimedia library): <http://www.pygame.org/news.html>
               • **discord.py** (discord library): <https://github.com/Rapptz/discord.py>

               **- OTHER -**
               • **Repository**: <https://github.com/python/cpython>
               • **Style Guide** (PEP8): <https://www.python.org/dev/peps/pep-0008/>
               ", "http://www.pngall.com/wp-content/uploads/2016/05/Python-Logo-PNG.png")
    |> Cogs.send
  end
end
