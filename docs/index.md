## Welcome to GitHub Pages

Hoge Hoge

## Pages

<ul>
  {% for a_page in site.pages %}
    <li>
      <a href="{{ site.github.url }}/{{ a_page.url }}">{{ a_page.title }}</a>
    </li>
  {% endfor %}
</ul>

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ site.github.url }}/{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
