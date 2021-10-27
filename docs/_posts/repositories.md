---
layout: post
title: "Reposiotries"
date: 2021-10-28
---

{% for repository in site.github.public_repositories %}

* [{{ repository.name }}]({{ repository.html_url }})

{% endfor %}
