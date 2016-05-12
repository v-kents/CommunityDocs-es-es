



<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-74512a14274465a8920f5f0e2a355c939441dd6f850e31a55d4824a53ff29bc6.css" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-0f29d3a644f4ac772e0a99f30f8f6e3f0b9bc7901b66ce709cffe3ea8cbab6ed.css" media="all" rel="stylesheet" />
    
    
    
    

    <link as="script" href="https://assets-cdn.github.com/assets/frameworks-f8175c23360b42a4eb18b2319fefeae252cfeea482fb804356f4136a52bfddb3.js" rel="preload" />
    
    <link as="script" href="https://assets-cdn.github.com/assets/github-08365733c21ea74018a6b0cfb4de049fc65e6f2ff525b20bce238b9757effdce.js" rel="preload" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>Community/DOM_Nodos-de-texto_Gestión-multinodal.md at master · Microsoft/Community</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="https://avatars0.githubusercontent.com/u/6154722?v=3&amp;s=400" name="twitter:image:src" /><meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="Microsoft/Community" name="twitter:title" /><meta content="Contribute to Community development by creating an account on GitHub." name="twitter:description" />
      <meta content="https://avatars0.githubusercontent.com/u/6154722?v=3&amp;s=400" property="og:image" /><meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="Microsoft/Community" property="og:title" /><meta content="https://github.com/Microsoft/Community" property="og:url" /><meta content="Contribute to Community development by creating an account on GitHub." property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="web-socket" href="wss://live.github.com/_sockets/MTY4OTk2NzE6Y2E2M2MxN2Q1MWUyZTFiNzQ0Zjc5MTU0MzQxMGU2OTc6MjkwNzcxZTlkYTY1OWNkNjRjNjgyZTc5YjExZWI4OWFjNDg3NjUxNGMzMGZiYjA4Zjc4NDA5YjMyMTYyZjc3Yw==--1d2a9ea084d2a832cad301350e0330693f5ec4ba">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
<meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="68096D95:06A8:593CE17:573494B2" name="octolytics-dimension-request_id" /><meta content="16899671" name="octolytics-actor-id" /><meta content="andygonusa" name="octolytics-actor-login" /><meta content="039dc8abcb612966ab512176b71a0165ccbe61e30209cccfe342b18b1e4c8e8f" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />



  <meta class="js-ga-set" name="dimension1" content="Logged In">



        <meta name="hostname" content="github.com">
    <meta name="user-login" content="andygonusa">

        <meta name="expected-hostname" content="github.com">
      <meta name="js-proxy-site-detection-payload" content="YzJjMzQxODUxMmIzYjc4MmFjNWE3YmFlYjY2OGNlMjhkY2EyYzhhZjlhYmE3NTE5ZTQ0OGRhNWM0YjIwMDQ4OHx7InJlbW90ZV9hZGRyZXNzIjoiMTA0LjkuMTA5LjE0OSIsInJlcXVlc3RfaWQiOiI2ODA5NkQ5NTowNkE4OjU5M0NFMTc6NTczNDk0QjIiLCJ0aW1lc3RhbXAiOjE0NjMwNjM3MzB9">


      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta content="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" name="form-nonce" />

    <meta http-equiv="x-pjax-version" content="c4a07a781c934c08a53884ce8261b9dd">
    

      
  <meta name="description" content="Contribute to Community development by creating an account on GitHub.">
  <meta name="go-import" content="github.com/Microsoft/Community git https://github.com/Microsoft/Community.git">

  <meta content="6154722" name="octolytics-dimension-user_id" /><meta content="Microsoft" name="octolytics-dimension-user_login" /><meta content="58566684" name="octolytics-dimension-repository_id" /><meta content="Microsoft/Community" name="octolytics-dimension-repository_nwo" /><meta content="false" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="58566684" name="octolytics-dimension-repository_network_root_id" /><meta content="Microsoft/Community" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/Microsoft/Community/commits/master.atom?token=AQHeV6rxNICrNSS4MqZ985yNVCWlR1QIks61QIPCwA%3D%3D" rel="alternate" title="Recent Commits to Community:master" type="application/atom+xml">


      <link rel="canonical" href="https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" data-pjax-transient>
  </head>


  <body class="logged-in   env-production windows vis-private page-blob">
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"></div>
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



        <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <svg aria-hidden="true" class="octicon octicon-mark-github" height="28" version="1.1" viewBox="0 0 16 16" width="28"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59 0.4 0.07 0.55-0.17 0.55-0.38 0-0.19-0.01-0.82-0.01-1.49-2.01 0.37-2.53-0.49-2.69-0.94-0.09-0.23-0.48-0.94-0.82-1.13-0.28-0.15-0.68-0.52-0.01-0.53 0.63-0.01 1.08 0.58 1.23 0.82 0.72 1.21 1.87 0.87 2.33 0.66 0.07-0.52 0.28-0.87 0.51-1.07-1.78-0.2-3.64-0.89-3.64-3.95 0-0.87 0.31-1.59 0.82-2.15-0.08-0.2-0.36-1.02 0.08-2.12 0 0 0.67-0.21 2.2 0.82 0.64-0.18 1.32-0.27 2-0.27 0.68 0 1.36 0.09 2 0.27 1.53-1.04 2.2-0.82 2.2-0.82 0.44 1.1 0.16 1.92 0.08 2.12 0.51 0.56 0.82 1.27 0.82 2.15 0 3.07-1.87 3.75-3.65 3.95 0.29 0.25 0.54 0.73 0.54 1.48 0 1.07-0.01 1.93-0.01 2.2 0 0.21 0.15 0.46 0.55 0.38C13.71 14.53 16 11.53 16 8 16 3.58 12.42 0 8 0z"></path></svg>
</a>


        <div class="header-search scoped-search site-scoped-search js-site-search" role="search">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/Microsoft/Community/search" class="js-site-search-form" data-scoped-search-url="/Microsoft/Community/search" data-unscoped-search-url="/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <label class="form-control header-search-wrapper js-chromeless-input-container">
      <div class="header-search-scope">This repository</div>
      <input type="text"
        class="form-control header-search-input js-site-search-focus js-site-search-field is-clearable"
        data-hotkey="s"
        name="q"
        placeholder="Search"
        aria-label="Search this repository"
        data-unscoped-placeholder="Search GitHub"
        data-scoped-placeholder="Search"
        tabindex="1"
        autocapitalize="off">
    </label>
</form></div>


      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item">
    

  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       data-ga-click="Header, create new, icon:add">
      <svg aria-hidden="true" class="octicon octicon-plus left" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 9H7v5H5V9H0V7h5V2h2v5h5v2z"></path></svg>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>

  <a class="dropdown-item" href="/new/import" data-ga-click="Header, import a repository">
    Import repository
  </a>


  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="Microsoft/Community">This repository</span>
  </div>
    <a class="dropdown-item" href="/Microsoft/Community/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>
    <a class="dropdown-item" href="/Microsoft/Community/settings/collaboration" data-ga-click="Header, create new collaborator">
      New collaborator
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-sw js-menu-target" href="/andygonusa"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@andygonusa" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/16899671?v=3&amp;s=40" width="20" />
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu  dropdown-menu-sw">
        <div class=" dropdown-header header-nav-current-user css-truncate">
            Signed in as <strong class="css-truncate-target">andygonusa</strong>

        </div>


        <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/andygonusa" data-ga-click="Header, go to profile, text:your profile">
            Your profile
          </a>
        <a class="dropdown-item" href="/stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
          <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
            Explore
          </a>
          <a class="dropdown-item" href="/integrations" data-ga-click="Header, go to integrations, text:integrations">
            Integrations
          </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>


          <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
            Settings
          </a>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/logout" class="logout-form" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="rBKLvsuoOJQaC825f9fZZ1UyoSJt+/7yxWaLl1uk1as1sn57hBkUaK/12M3hxEIywDdz2/6g4cdUETxqPnz/OA==" /></div>
            <button class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
              Sign out
            </button>
</form>
      </div>
    </div>
  </li>
</ul>


    
  </div>
</div>


      


    <div id="start-of-content" class="accessibility-aid"></div>

      <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode">
    <div id="js-repo-pjax-container" data-pjax-container>
      
<div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
  <div class="container repohead-details-container">

    

<ul class="pagehead-actions">

  <li>
        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="NlgAlwrkCd/7uycsq/dX7qocFJ+400myYYsNL/9nz7gilOFcf/A+p0Pg60tZcqQ8uRTABKMk9PhNbMYYjqEjyQ==" /></div>      <input class="form-control" id="repository_id" name="repository_id" type="hidden" value="58566684" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/Microsoft/Community/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
              <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6c4.94 0 7.94-6 7.94-6S13 2 8.06 2z m-0.06 10c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4z m2-4c0 1.11-0.89 2-2 2s-2-0.89-2-2 0.89-2 2-2 2 0.89 2 2z"></path></svg>
              Unwatch
            </span>
          </a>
          <a class="social-count js-social-count" href="/Microsoft/Community/watchers">
            7
          </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
            <div class="select-menu-header js-navigation-enable" tabindex="-1">
              <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48-3.75-3.75-3.75 3.75-1.48-1.48 3.75-3.75L0.77 4.25l1.48-1.48 3.75 3.75 3.75-3.75 1.48 1.48-3.75 3.75z"></path></svg>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5L4 13 0 9l1.5-1.5 2.5 2.5 6.5-6.5 1.5 1.5z"></path></svg>
                  <div class="select-menu-item-text">
                    <input id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6c4.94 0 7.94-6 7.94-6S13 2 8.06 2z m-0.06 10c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4z m2-4c0 1.11-0.89 2-2 2s-2-0.89-2-2 0.89-2 2-2 2 0.89 2 2z"></path></svg>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5L4 13 0 9l1.5-1.5 2.5 2.5 6.5-6.5 1.5 1.5z"></path></svg>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6c4.94 0 7.94-6 7.94-6S13 2 8.06 2z m-0.06 10c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4z m2-4c0 1.11-0.89 2-2 2s-2-0.89-2-2 0.89-2 2-2 2 0.89 2 2z"></path></svg>
                      Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5L4 13 0 9l1.5-1.5 2.5 2.5 6.5-6.5 1.5 1.5z"></path></svg>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-mute" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8 2.81v10.38c0 0.67-0.81 1-1.28 0.53L3 10H1c-0.55 0-1-0.45-1-1V7c0-0.55 0.45-1 1-1h2l3.72-3.72c0.47-0.47 1.28-0.14 1.28 0.53z m7.53 3.22l-1.06-1.06-1.97 1.97-1.97-1.97-1.06 1.06 1.97 1.97-1.97 1.97 1.06 1.06 1.97-1.97 1.97 1.97 1.06-1.06-1.97-1.97 1.97-1.97z"></path></svg>
                      Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/Microsoft/Community/unstar" class="starred" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="fHJN5AoiI4qVF3Ol716lZUYFoCuM/uaL6zgjiP0FBJE0utq/TrE20LW1fHk/MeGZ4CpSS+OHa9BFt2oJ3+CRjA==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar Microsoft/Community"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M14 6l-4.9-0.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14l4.33-2.33 4.33 2.33L10.4 9.26 14 6z"></path></svg>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/Microsoft/Community/stargazers">
          0
        </a>
</form>
    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/Microsoft/Community/star" class="unstarred" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ng+zEPWg/5zgBIZghUATgObSt19PqRrJOBFSEo02sfmA1tu+bhSqZNWon1yi3wE93EL8V1EXMPlnxMZ5THlQ8A==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star Microsoft/Community"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M14 6l-4.9-0.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14l4.33-2.33 4.33 2.33L10.4 9.26 14 6z"></path></svg>
        Star
      </button>
        <a class="social-count js-social-count" href="/Microsoft/Community/stargazers">
          0
        </a>
</form>  </div>

  </li>

  <li>
          <a href="#fork-destination-box" class="btn btn-sm btn-with-count"
              title="Fork your own copy of Microsoft/Community to your account"
              aria-label="Fork your own copy of Microsoft/Community to your account"
              rel="facebox"
              data-ga-click="Repository, show fork modal, action:blob#show; text:Fork">
              <svg aria-hidden="true" class="octicon octicon-repo-forked" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path d="M8 1c-1.11 0-2 0.89-2 2 0 0.73 0.41 1.38 1 1.72v1.28L5 8 3 6v-1.28c0.59-0.34 1-0.98 1-1.72 0-1.11-0.89-2-2-2S0 1.89 0 3c0 0.73 0.41 1.38 1 1.72v1.78l3 3v1.78c-0.59 0.34-1 0.98-1 1.72 0 1.11 0.89 2 2 2s2-0.89 2-2c0-0.73-0.41-1.38-1-1.72V9.5l3-3V4.72c0.59-0.34 1-0.98 1-1.72 0-1.11-0.89-2-2-2zM2 4.2c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2z m3 10c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2z m3-10c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2z"></path></svg>
            Fork
          </a>

          <div id="fork-destination-box" style="display: none;">
            <h2 class="facebox-header" data-facebox-id="facebox-header">Where should we fork this repository?</h2>
            <include-fragment src=""
                class="js-fork-select-fragment fork-select-fragment"
                data-url="/Microsoft/Community/fork?fragment=1">
              <img alt="Loading" height="64" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-128.gif" width="64" />
            </include-fragment>
          </div>

    <a href="/Microsoft/Community/network" class="social-count">
      0
    </a>
  </li>
</ul>

    <h1 class="entry-title private ">
  <svg aria-hidden="true" class="octicon octicon-lock" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M4 13h-1v-1h1v1z m8-6v7c0 0.55-0.45 1-1 1H1c-0.55 0-1-0.45-1-1V7c0-0.55 0.45-1 1-1h1V4C2 1.8 3.8 0 6 0s4 1.8 4 4v2h1c0.55 0 1 0.45 1 1z m-8.2-1h4.41V4c0-1.22-0.98-2.2-2.2-2.2s-2.2 0.98-2.2 2.2v2z m7.2 1H2v7h9V7z m-7 1h-1v1h1v-1z m0 2h-1v1h1v-1z"></path></svg>
  <span class="author" itemprop="author"><a href="/Microsoft" class="url fn" rel="author">Microsoft</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a href="/Microsoft/Community" data-pjax="#js-repo-pjax-container">Community</a></strong>
    <span class="repo-private-label">private</span>

</h1>

  </div>
  <div class="container">
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/Microsoft/Community" aria-selected="true" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /Microsoft/Community" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-code" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M9.5 3l-1.5 1.5 3.5 3.5L8 11.5l1.5 1.5 4.5-5L9.5 3zM4.5 3L0 8l4.5 5 1.5-1.5L2.5 8l3.5-3.5L4.5 3z"></path></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a href="/Microsoft/Community/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /Microsoft/Community/issues" itemprop="url">
        <svg aria-hidden="true" class="octicon octicon-issue-opened" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7S10.14 13.7 7 13.7 1.3 11.14 1.3 8s2.56-5.7 5.7-5.7m0-1.3C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7S10.86 1 7 1z m1 3H6v5h2V4z m0 6H6v2h2V10z"></path></svg>
        <span itemprop="name">Issues</span>
        <span class="counter">0</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/Microsoft/Community/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /Microsoft/Community/pulls" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-git-pull-request" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M11 11.28c0-1.73 0-6.28 0-6.28-0.03-0.78-0.34-1.47-0.94-2.06s-1.28-0.91-2.06-0.94c0 0-1.02 0-1 0V0L4 3l3 3V4h1c0.27 0.02 0.48 0.11 0.69 0.31s0.3 0.42 0.31 0.69v6.28c-0.59 0.34-1 0.98-1 1.72 0 1.11 0.89 2 2 2s2-0.89 2-2c0-0.73-0.41-1.38-1-1.72z m-1 2.92c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2zM4 3c0-1.11-0.89-2-2-2S0 1.89 0 3c0 0.73 0.41 1.38 1 1.72 0 1.55 0 5.56 0 6.56-0.59 0.34-1 0.98-1 1.72 0 1.11 0.89 2 2 2s2-0.89 2-2c0-0.73-0.41-1.38-1-1.72V4.72c0.59-0.34 1-0.98 1-1.72z m-0.8 10c0 0.66-0.55 1.2-1.2 1.2s-1.2-0.55-1.2-1.2 0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2z m-1.2-8.8c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2z"></path></svg>
      <span itemprop="name">Pull requests</span>
      <span class="counter">0</span>
      <meta itemprop="position" content="3">
</a>  </span>

    <a href="/Microsoft/Community/wiki" class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /Microsoft/Community/wiki">
      <svg aria-hidden="true" class="octicon octicon-book" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M2 5h4v1H2v-1z m0 3h4v-1H2v1z m0 2h4v-1H2v1z m11-5H9v1h4v-1z m0 2H9v1h4v-1z m0 2H9v1h4v-1z m2-6v9c0 0.55-0.45 1-1 1H8.5l-1 1-1-1H1c-0.55 0-1-0.45-1-1V3c0-0.55 0.45-1 1-1h5.5l1 1 1-1h5.5c0.55 0 1 0.45 1 1z m-8 0.5l-0.5-0.5H1v9h6V3.5z m7-0.5H8.5l-0.5 0.5v8.5h6V3z"></path></svg>
      Wiki
</a>

  <a href="/Microsoft/Community/pulse" class="js-selected-navigation-item reponav-item" data-selected-links="pulse /Microsoft/Community/pulse">
    <svg aria-hidden="true" class="octicon octicon-pulse" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M11.5 8L8.8 5.4 6.6 8.5 5.5 1.6 2.38 8H0V10h3.6L4.5 8.2l0.9 5.4L9 8.5l1.6 1.5H14V8H11.5z"></path></svg>
    Pulse
</a>
  <a href="/Microsoft/Community/graphs" class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors /Microsoft/Community/graphs">
    <svg aria-hidden="true" class="octicon octicon-graph" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M16 14v1H0V0h1v14h15z m-11-1H3V8h2v5z m4 0H7V3h2v10z m4 0H11V6h2v7z"></path></svg>
    Graphs
</a>
    <a href="/Microsoft/Community/settings" class="js-selected-navigation-item reponav-item" data-selected-links="repo_settings repo_branch_settings hooks /Microsoft/Community/settings">
      <svg aria-hidden="true" class="octicon octicon-gear" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M14 8.77V7.17l-1.94-0.64-0.45-1.09 0.88-1.84-1.13-1.13-1.81 0.91-1.09-0.45-0.69-1.92H6.17l-0.63 1.94-1.11 0.45-1.84-0.88-1.13 1.13 0.91 1.81-0.45 1.09L0 7.23v1.59l1.94 0.64 0.45 1.09-0.88 1.84 1.13 1.13 1.81-0.91 1.09 0.45 0.69 1.92h1.59l0.63-1.94 1.11-0.45 1.84 0.88 1.13-1.13-0.92-1.81 0.47-1.09 1.92-0.69zM7 11c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"></path></svg>
      Settings
</a>
</nav>

  </div>
</div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    

<a href="/Microsoft/Community/blob/5a20d7a70b4925f36e87cd8fefd40d072461603d/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:767bad655414ff8049dfc667ba9bfad2 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu branch-select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="master"
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48-3.75-3.75-3.75 3.75-1.48-1.48 3.75-3.75L0.77 4.25l1.48-1.48 3.75 3.75 3.75-3.75 1.48 1.48-3.75 3.75z"></path></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Find or create a branch…" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/Community/blob/live/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md"
               data-name="live"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5L4 13 0 9l1.5-1.5 2.5 2.5 6.5-6.5 1.5 1.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="live">
                live
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5L4 13 0 9l1.5-1.5 2.5 2.5 6.5-6.5 1.5 1.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="master">
                master
              </span>
            </a>
        </div>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/Microsoft/Community/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="RedycNqrpr29fkYVLyEFfn/BdSaRmTwGsTnnVQ0+U3V/fmWuuHpyLrOYlg+HgF1CAKfGythMHkSsgRjI5Cdhkg==" /></div>
          <svg aria-hidden="true" class="octicon octicon-git-branch select-menu-item-icon" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path d="M10 5c0-1.11-0.89-2-2-2s-2 0.89-2 2c0 0.73 0.41 1.38 1 1.72v0.3c-0.02 0.52-0.23 0.98-0.63 1.38s-0.86 0.61-1.38 0.63c-0.83 0.02-1.48 0.16-2 0.45V4.72c0.59-0.34 1-0.98 1-1.72 0-1.11-0.89-2-2-2S0 1.89 0 3c0 0.73 0.41 1.38 1 1.72v6.56C0.41 11.63 0 12.27 0 13c0 1.11 0.89 2 2 2s2-0.89 2-2c0-0.53-0.2-1-0.53-1.36 0.09-0.06 0.48-0.41 0.59-0.47 0.25-0.11 0.56-0.17 0.94-0.17 1.05-0.05 1.95-0.45 2.75-1.25s1.2-1.98 1.25-3.02h-0.02c0.61-0.36 1.02-1 1.02-1.73zM2 1.8c0.66 0 1.2 0.55 1.2 1.2s-0.55 1.2-1.2 1.2-1.2-0.55-1.2-1.2 0.55-1.2 1.2-1.2z m0 12.41c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2z m6-8c-0.66 0-1.2-0.55-1.2-1.2s0.55-1.2 1.2-1.2 1.2 0.55 1.2 1.2-0.55 1.2-1.2 1.2z"></path></svg>
            <div class="select-menu-item-text">
              <span class="select-menu-item-heading">Create branch: <span class="js-new-item-name"></span></span>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="MSDN/articles/web-dev/DOM_Nodos-de-texto_Gestión-multinodal.md">
</form>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/Microsoft/Community/find/master"
          class="js-pjax-capture-input btn btn-sm"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span class="js-path-segment"><a href="/Microsoft/Community"><span>Community</span></a></span></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/Community/tree/master/MSDN"><span>MSDN</span></a></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/Community/tree/master/MSDN/articles"><span>articles</span></a></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/Community/tree/master/MSDN/articles/web-dev"><span>web-dev</span></a></span><span class="separator">/</span><strong class="final-path">DOM_Nodos-de-texto_Gestión-multinodal.md</strong>
  </div>
</div>


  <div class="commit-tease">
      <span class="right">
        <a class="commit-tease-sha" href="/Microsoft/Community/commit/5a20d7a70b4925f36e87cd8fefd40d072461603d" data-pjax>
          5a20d7a
        </a>
        <relative-time datetime="2016-05-12T14:29:07Z">May 12, 2016</relative-time>
      </span>
      <div>
        <img alt="@andygonusa" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/16899671?v=3&amp;s=40" width="20" />
        <a href="/andygonusa" class="user-mention" rel="contributor">andygonusa</a>
          <a href="/Microsoft/Community/commit/5a20d7a70b4925f36e87cd8fefd40d072461603d" class="message" data-pjax="true" title="Update DOM_Nodos-de-texto_Gestión-multinodal.md">Update DOM_Nodos-de-texto_Gestión-multinodal.md</a>
      </div>

    <div class="commit-tease-contributors">
      <button type="button" class="btn-link muted-link contributors-toggle" data-facebox="#blob_contributors_box">
        <strong>2</strong>
         contributors
      </button>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="andygonusa" href="/Microsoft/Community/commits/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md?author=andygonusa"><img alt="@andygonusa" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/16899671?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="aldonetti" href="/Microsoft/Community/commits/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md?author=aldonetti"><img alt="@aldonetti" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/2181885?v=3&amp;s=40" width="20" /> </a>


    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@andygonusa" height="24" src="https://avatars1.githubusercontent.com/u/16899671?v=3&amp;s=48" width="24" />
            <a href="/andygonusa">andygonusa</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@aldonetti" height="24" src="https://avatars2.githubusercontent.com/u/2181885?v=3&amp;s=48" width="24" />
            <a href="/aldonetti">aldonetti</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/Microsoft/Community/raw/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/Microsoft/Community/blame/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/Microsoft/Community/commits/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" class="btn btn-sm " rel="nofollow">History</a>
    </div>

        <a class="btn-octicon tooltipped tooltipped-nw"
           href="github-windows://openRepo/https://github.com/Microsoft/Community?branch=master&amp;filepath=MSDN%2Farticles%2Fweb-dev%2FDOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md"
           aria-label="Open this file in GitHub Desktop"
           data-ga-click="Repository, open with desktop, type:windows">
            <svg aria-hidden="true" class="octicon octicon-device-desktop" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M15 2H1c-0.55 0-1 0.45-1 1v9c0 0.55 0.45 1 1 1h5.34c-0.25 0.61-0.86 1.39-2.34 2h8c-1.48-0.61-2.09-1.39-2.34-2h5.34c0.55 0 1-0.45 1-1V3c0-0.55-0.45-1-1-1z m0 9H1V3h14v8z"></path></svg>
        </a>

        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/Microsoft/Community/edit/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" class="inline-form js-update-url-with-hash" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="PyCqlX0LgQpPJntPgcipZ8TfeWS5ulUmjp8ToAN8GB0ebmbkz1BDmOO5krH5YiYNSNxSjdnw2clul93a54benQ==" /></div>
          <button class="btn-octicon tooltipped tooltipped-nw" type="submit"
            aria-label="Edit this file" data-hotkey="e" data-disable-with>
            <svg aria-hidden="true" class="octicon octicon-pencil" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M0 12v3h3l8-8-3-3L0 12z m3 2H1V12h1v1h1v1z m10.3-9.3l-1.3 1.3-3-3 1.3-1.3c0.39-0.39 1.02-0.39 1.41 0l1.59 1.59c0.39 0.39 0.39 1.02 0 1.41z"></path></svg>
          </button>
</form>        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/Microsoft/Community/delete/master/MSDN/articles/web-dev/DOM_Nodos-de-texto_Gesti%C3%B3n-multinodal.md" class="inline-form" data-form-nonce="f463ad60f4d3742a2c2ec6602eccf401212d5c3d" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="CQuiYIbZ3tIQFomcMfGCyN/9YV4vVzjB6YggJX5kgQR5ZFYjemtaTJPHsBXNBBmMr8gQ5tW/VtbPAiyXltAk0g==" /></div>
          <button class="btn-octicon btn-octicon-danger tooltipped tooltipped-nw" type="submit"
            aria-label="Delete this file" data-disable-with>
            <svg aria-hidden="true" class="octicon octicon-trashcan" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M10 2H8c0-0.55-0.45-1-1-1H4c-0.55 0-1 0.45-1 1H1c-0.55 0-1 0.45-1 1v1c0 0.55 0.45 1 1 1v9c0 0.55 0.45 1 1 1h7c0.55 0 1-0.45 1-1V5c0.55 0 1-0.45 1-1v-1c0-0.55-0.45-1-1-1z m-1 12H2V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9z m1-10H1v-1h9v1z"></path></svg>
          </button>
</form>  </div>

  <div class="file-info">
      421 lines (300 sloc)
      <span class="file-info-divider"></span>
    15.9 KB
  </div>
</div>

  
  <div id="readme" class="readme blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="text"><h1><a id="user-content-explorando-el-dom-nodos-de-texto-gestión-multinodal" class="anchor" href="#explorando-el-dom-nodos-de-texto-gestión-multinodal" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Explorando el DOM: Nodos de texto. Gestión multinodal</h1>

<p>©Jaime Peña Tresancos, 2015 </p>

<p><a href="https://twitter.com/jpt219">Twitter: @jpt219</a> </p>

<p><a href="https://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696">LinkedIn</a>  </p>

<p>En este trabajo hablaremos de ciertas labores de tratamiento de contenidos de los nodos de texto, en su vertiente de gestión de nodos hermanos o multinodos en general. </p>

<p>Todo ello será abordado con ejemplos ilustrativos para cada caso; en concreto: </p>

<ul>
<li><p>Conocimiento del número de nodos hijos de uno dado. </p></li>
<li><p>Propiedades básicas para la obtención de los contenidos de los nodos hijos de uno aludido. </p></li>
<li><p>Cómo recorrer todo el árbol de nodos hijos de uno dado –nodos hermanos-. </p></li>
<li><p>Obtención del contenido textual, formateado o no, de los nodos hijos de un nodo dado. </p></li>
<li><p>Obtención del contenido HTML de los nodos hijos, incluyendo o excluyendo las etiquetas del nodo padre aludido. </p></li>
</ul>

<p>En un anterior artículo, cuya referencia se cita seguidamente, habíamos tratado los aspectos más fundamentales de los nodos de texto; sugerimos se dé un repaso a su contenido antes de abordar el presente: </p>

<p><a href="https://msdn.microsoft.com/es-es/library/mt143193.aspx">Explorando el DOM: Nodos de texto. Creación, propiedades y métodos</a></p>

<h3><a id="user-content-referencias-del-dom" class="anchor" href="#referencias-del-dom" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Referencias del DOM</h3>

<p>Las bases de referencia vienen dadas por el denominado DOM <em>Document Object Model</em>. Inicialmente el DOM ha sido definido como una API <em>Application Programming Interface</em> para la gestión de documentos XML en general <em>eXtensible Markup Language, lenguaje de marcas extensible</em> y posteriormente implementada para documentos HTML en particular. </p>

<p>Para una descripción introductoria del DOM puede acudir a: <a href="http://es.wikipedia.org/wiki/Document_Object_Model">http://es.wikipedia.org/wiki/Document_Object_Model</a> </p>

<p>La documentación oficial y más recomendable sobre el DOM se encuentra en el foro del W3C –World Wide Web Consortium- en diversos niveles de conformidad, por ejemplo: </p>

<p><a href="http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html">http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html</a> </p>

<p><a href="http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html">http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html</a> </p>

<h3><a id="user-content-gestión-de-nodos-hermanos-sibling-text-nodes-" class="anchor" href="#gestión-de-nodos-hermanos-sibling-text-nodes-" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Gestión de nodos hermanos –sibling text nodes-</h3>

<p>Cuando nos encontremos con un nodo dado con diferentes nodos hijos, estos tendrán entre sí la relación de nodos hermanos. </p>

<p>Para tratar con ellos y extraer sus contenidos emplearemos, en los ejemplos, las siguientes propiedades: </p>

<table><thead>
<tr>
<th>Propiedad</th>
<th>Descripción</th>
</tr>
</thead><tbody>
<tr>
<td><em>firstChild</em></td>
<td>Primer nodo hijo, del nodo de texto aludido (sobre el que se aplica)</td>
</tr>
<tr>
<td><em>lastChild</em></td>
<td>Último nodo hijo, del nodo de texto aludido</td>
</tr>
<tr>
<td><em>nextSibling</em></td>
<td>Siguiente nodo hermano, del nodo de texto aludido</td>
</tr>
<tr>
<td><em>previousSibling</em></td>
<td>Previo nodo hermano, del nodo de texto aludido</td>
</tr>
<tr>
<td><em>childNodes</em></td>
<td>Colección de nodos hijos, del nodo de texto aludido</td>
</tr>
</tbody></table>

<p>En nuestros Listado 1 y Listado 2 y posteriormente en el Listado 3, extraeremos los contenidos de los nodos constituyentes del elemento </p><div> que hay en el cuerpo del documento. En los dos primeros casos, con aproximaciones diferentes –aunque similares- llegamos a obtener los tres nodos hijos. <p></p>

<p>En el tercer caso, extraeremos el contenido exclusivamente textual del segundo nodo, esto será extraer el nodo hijo del segundo nodo hijo del elemento &lt; div &gt;.</p>

<p>Obsérvese la diferencia en las imágenes adjuntas. </p>

<p>En lo esencial los respectivos listados contienen los siguientes códigos, con sus particularidades, fácilmente elucidables: </p>

<ul>
<li><p>Un botón de comando que al ser pulsado llamara a la función <em>hermanos()</em>. </p></li>
<li><p>En dicha función se recoge el contenido de la propiedad <em>childNodes</em> perteneciente al elemento </p><div> <em>único elemento</em> <div> que hay en el cuerpo del documento y recabamos su longitud de nodos hijos cantidad de ellos, para más detalles véase el apartado que sigue y, según los casos se utilizarán las propiedades mostradas en la tabla anterior y/o sus combinaciones para ir recuperando los diferentes nodos hermanos los hijos del nodo padre original. <p></p></div></div></li>
<li><p>Se expone el resultado en la consola de textos, <em>mediante console.log()</em>. </p></li>
<li><p>Obsérvese en las figuras que siguen el resultado en cada caso. (La figura de los Listado 1 y Listado 2 es la misma) </p></li>
</ul>

<p><strong>NOTA</strong>: Recuérdese que para acceder a la consola de textos de Internet Explorer hemos de pulsar la tecla F12 y posteriormente hacer clic sobre la pestaña Consola.</p>

<p><strong>Listado 1</strong>: Obtención de los contenidos de nodos hermanos versión 1. </p>

<pre><code>&lt;!doctype html&gt; 

&lt;html&gt; 

&lt;head lang="es-es"&gt; 

    &lt;meta charset="utf-8" /&gt; 

    &lt;title&gt;Text Node - siblings&lt;/title&gt; 

    &lt;script&gt; 

        function hermanos() { 

            var elementoDiv = document.querySelector('div'); 

            console.log(elementoDiv.childNodes.length);      // número de hijos (3) 

            console.log(elementoDiv.firstChild.data);        // primer hijo 

            console.log(elementoDiv.firstChild.nextSibling); // segundo hijo; el elemento &lt;i&gt; 

            console.log(elementoDiv.lastChild.data);         // último hijo 

        } 

    &lt;/script&gt; 

&lt;/head&gt; 

&lt;body&gt; 

    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt; 

    &lt;hr /&gt; 

    &lt;input type="button" value="siblings" onclick="hermanos()" /&gt; 

&lt;/body&gt; 

&lt;/html&gt; 
</code></pre>

<p><strong>Listado 2</strong>: Obtención de los contenidos de nodos hermanos versión 2. </p>

<pre><code>&lt;!doctype html&gt; 

&lt;html&gt; 

&lt;head lang="es-es"&gt; 

    &lt;meta charset="utf-8" /&gt; 

    &lt;title&gt;Text Node - siblings&lt;/title&gt; 

    &lt;script&gt; 

        function hermanos() { 

            var elementoDiv = document.querySelector('div'); 

            console.log(elementoDiv.childNodes.length);      // número de hijos (3) 

            console.log(elementoDiv.firstChild.data);        // primer hijo 

            console.log(elementoDiv.firstChild.nextSibling); // segundo hijo; el elemento &lt;i&gt; 

            console.log(elementoDiv.firstChild.nextSibling.nextSibling.data); // tercer hijo 

        } 

    &lt;/script&gt; 

&lt;/head&gt; 

&lt;body&gt; 

    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt; 

    &lt;hr /&gt; 

    &lt;input type="button" value="siblings" onclick="hermanos()" /&gt; 

&lt;/body&gt; 

&lt;/html&gt; 
</code></pre>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img1.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img1.png" alt="img1" style="max-width:100%;"></a></p>

<p><strong>Listado 3</strong>: Obtención de los contenidos de nodos hijos finales.</p>

<pre><code>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - siblings&lt;/title&gt;
    &lt;script&gt;
        function hermanos() {
            var elementoDiv = document.querySelector('div');
            console.log(elementoDiv.childNodes.length);      // número de hijos (3)
            console.log(elementoDiv.firstChild.data);        // primer hijo
            console.log(elementoDiv.firstChild.nextSibling.firstChild.data); // hijo del segundo hijo; hijo del elemento &lt;i&gt;
            console.log(elementoDiv.firstChild.nextSibling.nextSibling.data); // tercer hijo
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="siblings" onclick="hermanos()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img2.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img2.png" alt="img2" style="max-width:100%;"></a></p>

<h3><a id="user-content-recorrer-el-conjunto-de-nodos-hermanos" class="anchor" href="#recorrer-el-conjunto-de-nodos-hermanos" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Recorrer el conjunto de nodos hermanos</h3>

<p>En muchas, si no la mayor parte de las ocasiones de programación real, nos interesará, si acaso, conocer los contenidos de nodos hijos de un nodo dado que será pasado sin saber sus datos de antemano –al contrario de lo que era el caso de los ejemplos anteriores, que ya partíamos de la base de que eran tres nodos hijos-.
Una manera muy eficiente es mediante la propiedad <em>childNodes</em>, que hasta el presente habíamos utilizado para conocer el número de nodos hijos nodos hermanos, por tanto y nada más. Pero, su valor mayor es que almacena toda la colección de nodos hijos, comenzado a contar por el <em>childNodes[0]</em> que será el primero, hasta el <em>childNodes[childNodes.length-1]</em>, que será el último.</p>

<p>En el Listado 4 hemos programado:</p>

<ul>
<li>Un botón de comando que al ser pulsado llamara a la función <em>hermanos()</em>.</li>
<li>En dicha función se recoge el contenido de la propiedad <em>childNodes</em> perteneciente al elemento <div> –único elemento <div>- que hay en el cuerpo del documento y recabamos su longitud de nodos hijos y el contenido de cada uno de ellos, según un bucle que parte de <em>childNodes[0]</em>.</div></div></li>
<li>Se expone el resultado en la consola de textos, mediante <em>console.log()</em>.</li>
<li>Obsérvese en la figura que sigue el resultado.</li>
</ul>

<pre><code>**Listado 4**: Obtención recursiva de los nodos hijos –nodos hermanos- de uno dado.
&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - childNodes&lt;/title&gt;
    &lt;script&gt;
        function hermanos() {
            var elementoDiv = document.querySelector('div');
            var i = elementoDiv.childNodes.length;
            console.log(i);      // número de hijos (3)
            for (j = 0; j &lt; i; j++) {
                console.log(elementoDiv.childNodes[j]);
            }
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="siblings" onclick="hermanos()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img3.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img3.png" alt="img3" style="max-width:100%;"></a></p>

<h3><a id="user-content-obtención-de-los-textos-sin-marcas-html" class="anchor" href="#obtención-de-los-textos-sin-marcas-html" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Obtención de los textos sin marcas HTML</h3>

<p>Se tratará de extraer en el sentido de obtener el texto de todos los posibles elementos hijos de un nodo dado, en una única operación. A su vez, se eliminarán todas las marcas HTML de dichos nodos hijos.
Las propiedades a emplear son lo que se recogen en la tabla siguiente:</p>

<table><thead>
<tr>
<th>Propiedad</th>
<th>Descripción</th>
</tr>
</thead><tbody>
<tr>
<td><em>textContent</em></td>
<td>Extraerá todo el texto de los elementos hijos del nodo aludido, de manera formateada.</td>
</tr>
<tr>
<td><em>innerText</em></td>
<td>Extraerá el texto de los elementos hijos del nodo aludido, de manera no formateada. Se excluyen diversos tipos de textos.</td>
</tr>
</tbody></table>

<p>Las diferencias entre una y otra propiedad se pueden resumir en fundamentalmente:</p>

<ul>
<li><em>textContent</em> lee el contenido de todos los elementos, incluyendo los elementos <em>script</em> y <em>style</em>, innerText no los incluirá.</li>
<li><em>innerText</em> tiene en cuenta los estilos CSS y, por ejemplo, no retornará el texto de elementos ocultos.</li>
<li><em>textContent</em> devolverá los textos con el formato original, mientras que innerText los devolverá en una única cadena. (Véanse las figuras adjuntas)</li>
</ul>

<p>Para más información y ejemplos, puede acudirse a la dirección URL:
<a href="https://developer.mozilla.org/es/docs/Web/API/Node/textContent">https://developer.mozilla.org/es/docs/Web/API/Node/textContent</a></p>

<p>En el Listado 5 hemos programado lo que sigue:</p>

<ul>
<li>Un botón de comando que al ser pulsado llamara a la función <em>texto()</em>.</li>
<li>En dicha función se recoge el contenido de la propiedad <em>textContent</em> perteneciente a la cabecera del documento HTML <em>head</em>.</li>
<li>Se expone el resultado en la consola de textos, mediante <em>console.log()</em>.</li>
<li>Obsérvese en la figura que sigue el resultado, un texto formateado sin marcas HTML, con el contenido de la cabecera del documento HTML.</li>
</ul>

<p><strong>Listado 5</strong></p>

<pre><code>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - textContent&lt;/title&gt;
    &lt;script&gt;
        function texto() {
            console.log(document.head.textContent);         // Contenido textual
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="textContent" onclick="texto()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img4.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img4.png" alt="img4" style="max-width:100%;"></a></p>

<p>En el Listado 6 hemos programado lo que sigue:</p>

<ul>
<li>Un botón de comando que al ser pulsado llamara a la función <em>texto()</em>.</li>
<li>En dicha función se recoge el contenido de la propiedad innerText perteneciente a la cabecera del documento HTML <em>head</em>.</li>
<li>Se expone el resultado en la consola de textos, mediante <em>console.log()</em>.</li>
<li>Obsérvese en la figura que sigue el resultado, un texto no formateado sin marcas HTML, con el contenido de la cabecera del documento HTML.</li>
</ul>

<p>**Listado 6</p>

<pre><code>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - innerText&lt;/title&gt;
    &lt;script&gt;
        function texto() {
            console.log(document.head.innerText);         // Contenido textual
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="innerText" onclick="texto()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img5.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img5.png" alt="img5" style="max-width:100%;"></a></p>

<p>En el Listado 7 hemos programado lo que sigue:</p>

<ul>
<li>Un botón de comando que al ser pulsado llamara a la función <em>texto()</em>.</li>
<li>En dicha función se recoge el contenido de la propiedad innerHTML perteneciente al cuerpo del documento HTML <em>body</em>.</li>
<li>Se expone el resultado en la consola de textos, mediante <em>console.log()</em>.</li>
<li>Obsérvese en la figura que sigue el resultado, un texto formateado con marcas HTML, con el contenido del cuerpo del documento HTML. Se excluyen las etiquetas del nodo base, en nuestro caso ….</li>
</ul>

<p>**Listado 7</p>

<pre><code>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - innerHTML&lt;/title&gt;
    &lt;script&gt;
        function texto() {
            console.log(document.body.innerHTML);         // Contenido textual HTML
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="innerHTML" onclick="texto()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<h3><a id="user-content-obtención-de-los-textos-con-las-marcas-html" class="anchor" href="#obtención-de-los-textos-con-las-marcas-html" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Obtención de los textos con las marcas HTML</h3>

<p>Pasamos ahora a ver cómo obtener todo el contenido HTML anidado en un nodo dado, es decir, obtener el o los textos correspondientes, juntamente con las etiquetas de documento HTML que los acompañen.
Las propiedades a emplear son lo que se recogen en la tabla siguiente:</p>

<table><thead>
<tr>
<th>Propiedad</th>
<th>Descripción</th>
</tr>
</thead><tbody>
<tr>
<td><em>innerHTML</em></td>
<td>Devolverá la cadena formateada de la porción del código del documento HTML hijo.</td>
</tr>
</tbody></table>

<p>No se incluyen las etiquetas HTML del nodo base aludido.
<em>outerHTML</em> | Devolverá la cadena formateada de la porción del código del documento HTML hijo.
Se incluyen las etiquetas HTML del nodo base aludido.</p>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img6.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img6.png" alt="img6" style="max-width:100%;"></a></p>

<p>En el Listado 7 hemos programado lo que sigue:</p>

<ul>
<li>Un botón de comando que al ser pulsado llamara a la función texto().</li>
<li>En dicha función se recoge el contenido de la propiedad innerHTML perteneciente al cuerpo del documento HTML –body-.</li>
<li>Se expone el resultado en la consola de textos, mediante console.log().</li>
<li>Obsérvese en la figura que sigue el resultado, un texto formateado con marcas HTML, con el contenido del cuerpo del documento HTML. Se excluyen las etiquetas del nodo base, en nuestro caso ….</li>
</ul>

<p>**Listado 7</p>

<pre><code>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - innerHTML&lt;/title&gt;
    &lt;script&gt;
        function texto() {
            console.log(document.body.innerHTML);         // Contenido textual HTML
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="innerHTML" onclick="texto()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p>En el Listado 7 hemos programado lo que sigue:</p>

<ul>
<li>Un botón de comando que al ser pulsado llamara a la función texto().</li>
<li>En dicha función se recoge el contenido de la propiedad outerHTML perteneciente al cuerpo del documento HTML –body-.</li>
<li>Se expone el resultado en la consola de textos, mediante console.log().</li>
<li>Obsérvese en la figura que sigue el resultado, un texto formateado con marcas HTML, con el contenido del cuerpo del documento HTML. Se incluyen las etiquetas del nodo base, en nuestro caso ….</li>
</ul>

<p>**Listado 8</p>

<pre><code>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head lang="es-es"&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;title&gt;Text Node - outerHTML&lt;/title&gt;
    &lt;script&gt;
        function texto() {
            console.log(document.body.outerHTML);         // Contenido textual HTML
        }
    &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div&gt;Hola, &lt;i&gt;amigo y compañero&lt;/i&gt; de fatigas&lt;/div&gt;
    &lt;hr /&gt;
    &lt;input type="button" value="outerHTML" onclick="texto()" /&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p><a href="/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img6.png" target="_blank"><img src="/Microsoft/Community/raw/master/MSDN/articles/web-dev/img/img6.png" alt="img6" style="max-width:100%;"></a></p>

<h3><a id="user-content-conclusiones" class="anchor" href="#conclusiones" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Conclusiones</h3>

<p>En el presente artículo hemos visto cómo realizar diversas labores extracción –obtención, queremos significar- de textos de nodos hermanos, desde la base de un nodo padre determinado. Hemos repasado las formas de realizarlo, tanto si conocemos o no el número de hermanos y si queremos o no las marcas HTML adjuntas.
Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la próxima, tengan unas provechosas sesiones de programación.</p>
</div></article>
  </div>

</div>

<button type="button" data-facebox="#jump-to-line" data-facebox-class="linejump" data-hotkey="l" class="hidden">Jump to Line</button>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="form-control linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

  </div>
  <div class="modal-backdrop"></div>
</div>


    </div>
  </div>

    </div>

        <div class="container site-footer-container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage" class="site-footer-mark" title="GitHub">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="24" version="1.1" viewBox="0 0 16 16" width="24"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59 0.4 0.07 0.55-0.17 0.55-0.38 0-0.19-0.01-0.82-0.01-1.49-2.01 0.37-2.53-0.49-2.69-0.94-0.09-0.23-0.48-0.94-0.82-1.13-0.28-0.15-0.68-0.52-0.01-0.53 0.63-0.01 1.08 0.58 1.23 0.82 0.72 1.21 1.87 0.87 2.33 0.66 0.07-0.52 0.28-0.87 0.51-1.07-1.78-0.2-3.64-0.89-3.64-3.95 0-0.87 0.31-1.59 0.82-2.15-0.08-0.2-0.36-1.02 0.08-2.12 0 0 0.67-0.21 2.2 0.82 0.64-0.18 1.32-0.27 2-0.27 0.68 0 1.36 0.09 2 0.27 1.53-1.04 2.2-0.82 2.2-0.82 0.44 1.1 0.16 1.92 0.08 2.12 0.51 0.56 0.82 1.27 0.82 2.15 0 3.07-1.87 3.75-3.65 3.95 0.29 0.25 0.54 0.73 0.54 1.48 0 1.07-0.01 1.93-0.01 2.2 0 0.21 0.15 0.46 0.55 0.38C13.71 14.53 16 11.53 16 8 16 3.58 12.42 0 8 0z"></path></svg>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2016 <span title="0.09502s from github-fe152-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    

    <div id="ajax-error-message" class="ajax-error-message flash flash-error">
      <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M15.72 12.5l-6.85-11.98C8.69 0.21 8.36 0.02 8 0.02s-0.69 0.19-0.87 0.5l-6.85 11.98c-0.18 0.31-0.18 0.69 0 1C0.47 13.81 0.8 14 1.15 14h13.7c0.36 0 0.69-0.19 0.86-0.5S15.89 12.81 15.72 12.5zM9 12H7V10h2V12zM9 9H7V5h2V9z"></path></svg>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48-3.75-3.75-3.75 3.75-1.48-1.48 3.75-3.75L0.77 4.25l1.48-1.48 3.75 3.75 3.75-3.75 1.48 1.48-3.75 3.75z"></path></svg>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/compat-7db58f8b7b91111107fac755dd8b178fe7db0f209ced51fc339c446ad3f8da2b.js"></script>
      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-f8175c23360b42a4eb18b2319fefeae252cfeea482fb804356f4136a52bfddb3.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-08365733c21ea74018a6b0cfb4de049fc65e6f2ff525b20bce238b9757effdce.js"></script>
      
      
      
      
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M15.72 12.5l-6.85-11.98C8.69 0.21 8.36 0.02 8 0.02s-0.69 0.19-0.87 0.5l-6.85 11.98c-0.18 0.31-0.18 0.69 0 1C0.47 13.81 0.8 14 1.15 14h13.7c0.36 0 0.69-0.19 0.86-0.5S15.89 12.81 15.72 12.5zM9 12H7V10h2V12zM9 9H7V5h2V9z"></path></svg>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
    <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48-3.75-3.75-3.75 3.75-1.48-1.48 3.75-3.75L0.77 4.25l1.48-1.48 3.75 3.75 3.75-3.75 1.48 1.48-3.75 3.75z"></path></svg>
    </button>
  </div>
</div>

  </body>
</html>

