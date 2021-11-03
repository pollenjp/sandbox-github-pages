## Welcome to GitHub Pages

Hoge Hoge

## Pages

<ul>
  {% for a_page in site.html_pages %}
    {% if a_page.title != page.title %}
      <li>
        <a href="{{ site.github.url }}{{ a_page.url }}">{{ a_page.title }}</a>
      </li>
    {% endif %}
  {% endfor %}
</ul>

## Posts

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ site.github.url }}{{ post.url }}">
        {{ post.date | date: "%Y-%m-%d" }} {{ post.title }}
      </a>
    </li>
  {% endfor %}
</ul>
