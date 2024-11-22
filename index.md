---
layout: default
section_id: home
slides:
  - bg: images/@stock/whitewater-and-rocks-2320x1600.jpg
    small_title:
      klass: bottom-to-top
      text: Helping you navigate
    title:
      klass: bottom-to-top
      text: Uncharted waters
    buttons:
      klass: bottom-to-top
      items:
        - text: Learn More
          link_to: http://github.com/mergefailure
  - bg: images/@stock/hands-on-keyboard.jpg
    klass: centered-text
    small_title:
      klass: bottom-to-top
      text: We make websites that are
    title:
      klass: bottom-to-top
      text: Creative &amp; Powerful
    buttons:
      klass: bottom-to-top
      items:
        - klass: boxed
          text: View Features
          link_to: http://github.com/mergefailure
        - text: Purchase Now
          link_to: http://github.com/mergefailure

  - bg: images/@stock/slide-5.jpg
    small_title:
      klass: bottom-to-top
      text: This is a creative theme that you'll
    title:
      klass: bottom-to-top
      text: definitely love...
    buttons:
      klass: bottom-to-top
      items:
        - text: Learn More
          link_to: http://github.com/mergefailure

works:
  - image: images/@stock/work-1.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-2.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-3.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-4.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-5.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-6.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-7.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development
  - image: images/@stock/work-8.jpg
    title: Beautiful Girl
    link_to: portfolio-item.html
    klass: graphi-design
    desc: Design &amp; Development




milestones:
  - icon: folder-open
    from: 0
    to: 69
    title: Projects Completed
  - icon: coffee
    from: 0
    to: 726
    title: Cups of coffee offered
  - icon: thumbs-up
    from: 0
    to: 59
    title: Happy coders
  - icon: file-alt
    from: 0
    to: 21
    title: Articles Published

---


<div class='mod modDefaultSlider'>
  <div class='sequence' data-autostop='on' data-timeout='0'>
    <a class='sequence-prev' href='javascript:void(0);'>
      <span></span>
    </a>
    <a class='sequence-next' href='javascript:void(0);'>
      <span></span>
    </a>
    <ul class='sequence-pagination'>
      {% for slide in page.slides %}
        {% if forloop.first %}
          {% assign class = 'current' %}
        {% else %}
          {% assign class = '' %}
        {% endif %}
        <li class="{{class}}"></li>
      {% endfor %}
    </ul>
    <ul class='sequence-canvas'>
      {% for slide in page.slides %}
        {% if forloop.first %}
          {% assign style = 'static' %}
        {% else %}
          {% assign style = '' %}
        {% endif %}

        <li class='frame {{style}} {{ slide.klass }}'>
          <div class='bg' style='background-image: url({{ slide.bg}});'></div>
          <div class='small-title {{ slide.small_title.klass }}'>
            <div class='row'>
              <div class='large-12 columns'>
                <h2>{{ slide.small_title.text }}</h2>
              </div>
            </div>
          </div>
          <div class='title {{ slide.title.klass }}'>
            <div class='row'>
              <div class='large-12 columns'>
                <h2>{{ slide.title.text }}</h2>
              </div>
            </div>
          </div>
          <div class='buttons-wrapper {{ slide.buttons.klass }}'>
            <div class='row'>
              <div class='large-12 columns'>
                <div class='two spacing'></div>
                {% for button in slide.buttons.items %}
                  <a class='button {{ button.klass }}' href='{{ button.link_to }}'>{{ button.text }}</a>
                {% endfor %}
              </div>
            </div>
          </div>
        </li>
      {% endfor %}
    </ul>
  </div>
</div>

<div class="four spacing"></div>

<div class="row">
  <div class="medium-3 large-3 columns">
    {% include icon-text.html title='Creative design' desc='There was some latin here ' icon_class='fa fa-flask' delay='0' shape_class='icon-text-circle' %}
  </div>
  <div class="medium-3 large-3 columns">
    {% include icon-text.html title='Creative design' desc='And here.' icon_class='fa fa-paper-plane' delay='200' shape_class='icon-text-circle' %}
  </div>
  <div class="medium-3 large-3 columns">
    {% include icon-text.html title='Creative design' desc='And here.' icon_class='fa fa-tablet' delay='400' shape_class='icon-text-circle' %}
  </div>
  <div class="medium-3 large-3 columns">
    {% include icon-text.html title='Creative design' desc='This stuff is everywhere.' icon_class='fa fa-comments' delay='600' shape_class='icon-text-circle' %}
  </div>
</div>

<div class="spacing"></div>

<div class="full" style="background: #f5f5f5;">
  <div class="row">
    <div class="large-12 columns">
      {% include section-header.html title="Our works" %}
      <div class="spacing"></div>
      <p>
        There was more latin here but not any more.
      </p>
      <div class="three spacing"></div>
    </div>
  </div>

  <div class="mod modGallery">
    <ul class="gallery small-block-grid-2 medium-block-grid-3 large-block-grid-4">
      {% for work in page.works %}
        <li class="{{ work.klass }}">
          <a href='{{ work.link_to }}'>
            <img alt="" src="{{ work.image }}" />
            <div class='overlay'>
              <div class='thumb-info'>
                <h3>{{ work.title }}</h3>
                <p>{{ work.desc }}</p>
              </div>
            </div>
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
</div>


<div class='full'>
  <div class='row'>
    <div class='large-12 columns'>
      {% include section-header.html title="Our services" %}
      <div class='spacing'></div>
      <p>
        And here too but now, thankfully it's gone 
      </p>
      <div class='three spacing'></div>
    </div>
  </div>
  <div class='row'>
    <div class='medium-6 columns'>
      <img class="fadeinleft" alt="" src="images/@stock/responsive.png" />
      <div class='three spacing'></div>
    </div>
    <div class='medium-6 columns'>
      {% for service in site.data.services.list %}
        <div class='fadein mod modIconText' data-delay='{{ 300 | times:forloop.index0 }}'>
          <div class='icon-text-simple'>
            <i class='fa fa-{{service.icon}}'></i>
            <h3>{{service.title}}</h3>
            <p>{{service.desc}}</p>
          </div>
          <div class='two spacing'></div>
        </div>
      {% endfor %}
    </div>
  </div>
  <div class='spacing'></div>
</div>


<div class='full parallax' style='background-image: url(images/@stock/milestone-bg.jpg); color: #fff;'>
  <div class='row'>
    <div class='large-12 columns'>
      {% include section-header.html title="Parallax effect" color="#fff" %}
      <div class='spacing'></div>
      <p class='centered-text' style='color: #ccc;'>
        Oh that it creeps in everywhere
      </p>
      <div class='two spacing'></div>
    </div>
  </div>
  <div class='row'>
    {% for milestone in page.milestones %}
      <div class='medium-3 large-3 columns'>
        <div class='mod modMilestone'>
          <i class='fa fa-{{milestone.icon}}'></i>
          <strong data-from='{{milestone.from}}' data-to='{{milestone.to}}'>&nbsp;</strong>
          <span>{{milestone.title}}</span>
          <div class='four spacing'></div>
        </div>
      </div>
    {% endfor %}
  </div>
  <div class='two spacing'></div>
</div>

<div class='full'>
  <div class='row'>
    <div class='large-12 columns'>
      {% include section-header.html title="Our team" %}
      <div class='spacing'></div>
      <p>
      Even here ... 
	</p>
      <div class='two spacing'></div>
    </div>
  </div>
  <div class='row'>
    {% for member in site.data.members %}
      <div class='small-6 medium-3 large-3 columns'>
        <div class='mod modTeamMember'>
          <div class='member'>
            <img class="avatar" alt="" src="{{ member.avatar }}" />
            <div class='overlay'>
              <div class='intro'>
                <h3>{{member.name}}</h3>
                <p>{{member.position}}</p>
                <ul class='socials'>
                  {% for social in member.socials %}
                    <li>
                      <a href='{{social.link}}'>
                        <i class='fab fa-{{social.icon}}'></i>
                      </a>
                    </li>
                  {% endfor %}
                </ul>
              </div>
            </div>
          </div>
          <div class='two spacing'></div>
        </div>
      </div>
    {% endfor %}
  </div>
</div>

<div class='full' style='background: #f5f5f5'>
  <div class='row'>
    <div class='large-12 columns'>
      {% include section-header.html title="Our recent posts" %}
      <div class='spacing'></div>
      <p>
        I'd be adding even more stock text here if it weren't for google adwords saying, hey guy, no latin !
      </p>
      <div class='two spacing'></div>
    </div>
  </div>

  <div class='row'>
    {% for post in site.posts %}
      {% if forloop.index > 3 %}
        {% break %}
      {% endif %}

      <div class='large-4 medium-4 columns'>
        <div class='mod modBlogPost'>
          {% for image in post.images %}
            {% unless forloop.first %}
              {% break %}
            {% endunless %}
            <a href="{{post.url}}"><img alt="" src="{{image}}" /></a>
          {% endfor %}
          <div class='content'>
            <p class='date'>{{post.date | date: "%B %d, %Y" }}</p>
            <h4><a href="#">{{post.title}}</a></h4>
            <p>{{post.excerpt}}</p>
            <!--
              <div class="tags">
                {% for cat in post.categories %}
                  <a href="#">{{cat | capitalize}}</a>
                  {% unless forloop.last %}
                    ,
                  {% endunless %}
                {% endfor %}
              </div>
            -->
          </div>
        </div>
      </div>

    {% endfor %}

  </div>


  <div class='two spacing'></div>
  <div class='row'>
    <div class='large-12 columns'>
      <p class='centered-text'>
        <a class='button' href='blog.html'>See more posts</a>
      </p>
    </div>
  </div>
  <div class='two spacing'></div>

</div>


{% include our-customers.html %}


<div class='full no-padding' style='background: #fff'>
  <div class='two spacing'></div>
  <div class='mod modCallToAction'>
    <div class='row'>
      <div class='medium-9 large-9 columns'>
        <p>Would you like to know more?</p>
      </div>
      <div class='medium-3 large-3 columns'>
        <a class='button' href='http://github.com/mergefailure'>Learn more</a>
      </div>
    </div>
  </div>
  <div class='spacing'></div>
</div>
