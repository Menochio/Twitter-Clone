<html lang="en" class=""><head>
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=DM+Sans&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="icon" type="image/png" href="/static/images/favicon.ico">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" integrity="sha512-RNLkV3d+aLtfcpEyFG8jRbnWHxUqVZozacROI4J2F1sTaDqo1dPQYs01OMi1t1w9Y2FdbSCDSQ2ZVdAC8bzgAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

        <style class="INLINE_PEN_STYLESHEET_ID">
        :root {
            --background: #ffffff;
            --cs-primary: #25b9f4;
            --cs-surface: #ffffff;
            --cs-surface-2: #eef4f8;
            --cs-separator: #e8ecf0;
            --cs-on-surface-primary: #000000;
            --cs-on-surface-secondary: #657786;
            --font-family-primary: "DM Sans", Aria, sans-serif;
            --joke-author-img-width: 60px;
            --joke-width: 480px;
            --layout-container-width: 920px;
        }
        * {
            box-sizing: border-box;
        }
        html,
        body {
            background: var(--background);
            font-family: var(--font-family-primary);
            font-size: 14px;
            line-height: 1.42;
            height: 100%;
        }
        #root {
            height: 100%;
        }
        .joke {
            background-color: var(--cs-surface);
            padding: 15px;
            min-height: calc(33px + var(--joke-author-img-width));
            transition: background-color 0.25s;
        }
        .joke:focus,
        .joke:hover {
            background-color: var(--cs-surface-2);
        }
        .joke_wrapper {
            margin-left: calc(1.25 * var(--joke-author-img-width));
        }
        .joke_block {
            position: relative;
        }
        .joke_block--header .joke_element {
            display: inline-block;
            margin-right: 7px;
        }
        .joke_element--author-img {
            height: var(--joke-author-img-width);
            left: calc(-1.25 * var(--joke-author-img-width));
            position: absolute;
            top: 3px;
            width: var(--joke-author-img-width);
        }
        .joke_element--author-img img {
            border-radius: 50%;
            max-width: 100%;
        }
        .joke_element--author-name {
            color: var(--cs-on-surface-primary);
            font-weight: bold;
        }
        .joke_element--author-username {
            color: var(--cs-on-surface-secondary);
        }
        .joke_element {
            margin: 0;
        }
        .joke_block--text {
            font-size: 18px;
            margin-top: 7px;
        }
        .joke_block--footer {
            margin-top: 12px;
        }
        .layout {
            height: 100%;
        }
        .layout_wrapper {
            display: grid;
            grid-template-columns: 140px 480px 1fr;
            height: 100%;
            margin: auto;
            width: var(--layout-container-width);
        }
        .layout_header {
            background-color: var(--cs-surface);
            height: 100%;
        }
        .layout_content {
            border-left: 1px solid var(--cs-separator);
            border-right: 1px solid var(--cs-separator);
            width: var(--joke-width);
        }
        .layout_footer {
            padding: 20px;
        }
        .feed_header {
            border-bottom: 1px solid var(--cs-separator);
            padding: 20px;
        }
        .feed {
            margin-bottom: 60px;
        }
        .feed_title {
            font-size: 20px;
            font-weight: bolder;
            margin: 0;
        }
        .feed_subtitle {
            color: var(--cs-on-surface-secondary);
            margin: 0;
            margin-top: 7px;
        }
        .feed_item {
            border-bottom: 1px solid var(--cs-separator);
        }
        .feed_error {
            padding: 40px;
            text-align: center;
        }
        .feed_error_icon {
            fill: hsla(197, 20%, 92%, 1);
            height: 90px;
            width: 90px;
        }
        .feed_error_title {
            color: var(--cs-on-surface-primary);
            font-weight: bold;
            margin: 0;
            margin-top: 1.3em;
        }
        .feed_error_text {
            color: var(--cs-on-surface-secondary);
            margin: 0;
            margin-top: 0.7em;
        }
        .navbar--header {
            background-color: #ffffff;
            /*box-shadow: 0 5px 30px hsla(197 , 75%, 55%, .08);*/
            position: relative;
        }
        .navbar_block {
            padding: 8px;
        }
        .navbar_header {
            display: flex;
            justify-content: flex-end;
        }
        .navbar_brand {
            display: block;
            padding: 20px 20px;
        }
        .navbar_brand svg {
            display: block;
            fill: var(--cs-primary);
            height: 34px;
            width: 34px;
        }
        .form--search-form input {
            -webkit-appearance: none;
            background-color: #e8ecf0;
            border: 2px solid #e8ecf0;
            border-radius: 25px;
            font-size: 12px;
            line-height: 1;
            outline: none;
            padding: 8px 12px;
            width: 100%;
        }
        .form--search-form input::placeholder {
            font-style: italic;
        }
        .form--search-form input:focus {
            border: 2px solid var(--cs-primary);
        }
        .nav {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        .nav--joke_rebound .nav_item {
            display: inline-block;
            margin-right: 70px;
        }
        .nav--joke_rebound .nav_link svg {
            display: block;
            fill: var(--cs-on-surface-secondary);
            height: 20px;
            margin-right: 5px;
            width: 20px;
        }
        .nav--joke_rebound .nav_link {
            align-items: center;
            color: var(--cs-on-surface-secondary);
            display: flex;
            text-decoration: none;
        }
        .nav--joke_rebound .nav_link:hover {
            color: var(--cs-primary);
        }
        .nav--joke_rebound .nav_link:hover svg {
            fill: var(--cs-primary);
        }
        .pagination--infinite-scroll .pagination_button_next {
            background-color: #ffffff;
            border-color: transparent;
            color: var(--cs-primary);
            cursor: pointer;
            letter-spacing: 0.045em;
            padding: 20px;
            width: 100%;
        }
        .section {
            background-color: var(--cs-surface-2);
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .section--search {
            background-color: #ffffff;
        }
        .section_block {
            padding: 15px;
        }
        .section_block--header {
            border-bottom: 1px solid var(--cs-separator);
        }
        .section_block--content p {
            margin: 0;
            margin-bottom: 1em;
        }
        .section_title {
            margin: 0;
        }
        .nav_item + .nav_item {
            margin-top: 10px;
        }
        .nav_link {
            color: var(--cs-on-surface-primary);
            text-decoration: none;
        }
        .nav_link_text--primary {
            color: var(--cs-on-surface-primary);
            display: block;
            font-weight: bold;
            font-size: 16px;
        }
        .nav_link_text--secondary {
            color: var(--cs-on-surface-secondary);
        }

        textarea {
            border: 0;
            border-radius: 0.5em;
            box-shadow: 0 0 0 0.1em #a8ceee inset;
            margin: 0 auto 0.75em auto;
            padding: 0.75em;
            resize: none;
            width: 100%;
            height: 5em;
        }
        .bottom {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .bottom > span {
            margin-right: 0.75em;
        }
        button {
            background-color: #55abee;
            border: 0;
            color: #fff;
            display: inline-block;
            font-weight: bold;
        }
        button span {
            display: block;
            padding: 0.75em 1.5em;
            transition: all 0.1s linear;
        }
        button,
        button span {
            border-radius: 1.5em;
        }
    </style>

    <body>
        <div id="root">

            <div>
                <div class="layout">
                    <div class="layout_wrapper">
                        <div class="layout_header">
                            <div class="navbar navbar--header">
                                <div class="navbar_container">
                                    <div class="navbar_header">
                                        <a class="navbar_brand" href="#/">
                                            <svg viewBox="0 0 24 24" aria-label="Twitter" role="img" class="r-13v1u17 r-4qtqp9 r-yyyyoo r-16y2uox r-lwhw9o r-dnmrzs r-bnwqim r-1plcrui r-lrvibr">
                                                <g>
                                                    <path d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z"></path>
                                                </g>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layout_content">
                            <div class="feed">
                                <div class="feed_header">
                                    <h1 class="feed_title">Home</h1>
                                </div>
                                <div class="feed_item">
                                    <div class="joke">
                                        <textarea id="tweet-message" rows="3" placeholder="What's happening?"></textarea>
                                        <div class="bottom">
                                            <span data-limit="280">280</span>
                                            <button id="create-tweet" type="submit" tabindex="0">
                                                <span tabindex="-1">Tweet</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div id="tweet-content">
                                </div>
                                <script id="tweet-template" type="text/x-handlebars-template">
                                     {{#data}}
                                         <div class="feed_item">
                                             <div class="joke">
                                                 <div class="joke_wrapper">
                                                     <div class="joke_block joke_block--header">
                                                         <span class="joke_element joke_element--author-name">{{name}}</span><span class="joke_element joke_element--author-username">{{email}}</span>
                                                         <div class="joke_element joke_element--author-img"><img src="/static/images/dummy.jpg"></div>
                                                     </div>
                                                     <div class="joke_block joke_block--text">{{message}}</div>
                                                     <div class="joke_block joke_block--footer">
                                                         <ul class="nav nav--joke_rebound">
                                                             <li class="nav_item">
                                                                 <a class="nav_link nav_link--upvotes" href="#">
                                                                     <svg name="joke_upvotes" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                                         <path d="M22 12c0 5.514-4.486 10-10 10s-10-4.486-10-10 4.486-10 10-10 10 4.486 10 10zm2 0c0-6.627-5.373-12-12-12s-12 5.373-12 12 5.373 12 12 12 12-5.373 12-12zm-14 6v-12c-1.465.331-4 2.827-4 6.001 0 3.134 2.521 5.665 4 5.999zm3.998 0l-.506-.755s.947-.503.947-1.746c0-1.207-.947-1.745-.947-1.745l.506-.754c.748.281 2.002 1.205 2.002 2.499 0 1.295-1.254 2.218-2.002 2.501zm0-7l-.506-.755s.947-.503.947-1.746c0-1.207-.947-1.745-.947-1.745l.506-.754c.748.281 2.002 1.205 2.002 2.499 0 1.295-1.254 2.218-2.002 2.501z"></path>
                                                                     </svg>
                                                                     4
                                                                 </a>
                                                             </li>
                                                             <li class="nav_item">
                                                                 <a class="nav_link nav_link--downvotes" href="#">
                                                                     <svg name="joke_downvotes" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                                         <path d="M3.491 11.432v3.568h-2.254v-4.592c0-.779.366-1.512.989-1.979l4.821-3.621c.678-.509 1.078-.603 2.962-1.305.308-.114.513-.408.513-.737v-2.767h2.226v3.904c0 .688-.412 1.308-1.045 1.574l-2.481 1.045 2.537 3.433c1.046-.764 1.726-1.459 2.937-1.225l6.167 1.195-.529 2.713-4.865-.862c-1.489-.264-2.649 1.422-1.777 2.6 1.446 1.955 1.901 2.427 2.236 3.554l1.004 3.382-2.498 1.477-1.317-4.101c-.667-2.08-3.731-2.829-5.16-4.954l-2.839-4.226c-.723.563-1.627 1.037-1.627 1.924zm.096-10.941c-1.428 0-2.587 1.158-2.587 2.586 0 1.429 1.159 2.586 2.587 2.586 1.429 0 2.587-1.158 2.587-2.586.001-1.428-1.157-2.586-2.587-2.586zm17.184 23.508c3.614 0 2.383-4.295-.504-2.512-1.028.58-2.828 1.695-4.166 2.512h4.67z"></path>
                                                                     </svg>
                                                                     339
                                                                 </a>
                                                             </li>
                                                         </ul>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     {{/data}}
                                </script>

                                <div class="feed_footer">
                                    <div class="pagination pagination--infinite-scroll"><button class="pagination_button_next">Load more...</button></div>
                                </div>
                            </div>
                        </div>
                        <jsp:include page="templates/footer.jsp"/>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#create-tweet").click(function () {
                $.ajax({
                    type: "POST",
                    url: "/user/create-post",
                    data: document.getElementById("tweet-message").value,
                    success: function (response) {
                        if (!!response) {
                            window.location.reload();
                        }
                    },
                    contentType: "application/json",
                });
            });

            var tweet_ui_source = $("#tweet-template").html();
            var tweet_template = Handlebars.compile(tweet_ui_source)
            window.lastSeenTweet = 999999

           function showTweets(){
               $.ajax({
                  type:"POST",
                  url:"/user/public-tweet/"+window.lastSeenTweet,
                  success:function(response){
                      var tweet_data = {
                           data:response
                      };
                      var size = response.length;
                      window.lastSeenTweet = response[size-1].id;
                       $("#tweet-content").append(tweet_template(tweet_data))
                  },
                  contentType:"application/json"
              })
           }

           showTweets();

            $(".pagination--infinite-scroll").click(function () {
                showTweets();
            });
        </script>


</body></html>