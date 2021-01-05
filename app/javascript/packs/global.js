// This is custom for GaryVee.  It needs review and updating.
// source: https://2pyzcd2sdlnr1r3xjh15mrbn-wpengine.netdna-ssl.com/wp-content/themes/garysixteen/assets/js/global.min.js?v=2
//
//  front.js popupWindow might be needed for sharing
// links to scroll

function fbInit(t) {
  "undefined" != typeof FB
    ? _.isFunction(t) && t()
    : ($.ajaxSetup({ cache: !0 }),
      $.getScript("//connect.facebook.net/en_US/sdk.js", function() {
        window.FB.init({ appId: window.FB_APP_ID, version: "v2.4" }),
          _.isFunction(t) && t();
      }));
}
function onYouTubeIframeAPIReady() {
  if (window.is_askgaryveee_post === !0) {
    var t, e, n, o, s, r;
    if ($(".ct-post-content").html()) {
      var a = document.getElementsByTagName("iframe");
      for (
        r = $(".ct-post-content")
          .html()
          .match(/\d+:\d+/g),
          i = 0;
        i < r.length;
        i++
      )
        $("body")
          .children()
          .each(function() {
            $(this).html(
              $(this)
                .html()
                .replace(
                  r[i],
                  '<span class="timestamp link-blue">' + r[i] + "</span>"
                )
            );
          });
      if (
        ((t = "player_frame"),
        $(a).each(function() {
          ($(this).attr("id") && "player_frame" !== $(this).attr("id")) ||
            ((a = $(this)),
            (n = a.parent()),
            (o = $(this).attr("src")),
            (s = o.split(/embed\/|\?|list=/)),
            a.remove());
        }),
        !a.attr)
      )
        return null;
      n.append("<div id=player_frame></div>"),
        a.attr("id", t),
        (e = new YT.Player(t, {
          videoId: s[1],
          playerVars: { listType: "playlist", list: s[3] },
        })),
        $(".timestamp").on("click", function() {
          event.preventDefault(),
            (time = $(this).text()),
            (timeSplit = time.split(":")),
            (seconds = 60 * parseInt(timeSplit[0]) + parseInt(timeSplit[1])),
            e.seekTo(seconds, !0).playVideo();
        });
    }
  }
}
var GV = (window.GV = {
  module: (function() {
    var t = {};
    return function(e, i) {
      return "all" === e ? t : t[e] ? t[e] : i ? (t[e] = i) : (t[e] = {});
    };
  })(),
  init: function() {
    return (
      (this.$window = $(window)),
      this.module("mq") && this.module("mq").init(),
      $("body").removeClass("modal-active"),
      Cookies.get("gvctafirst") ||
        ($("#ct-main-nav").addClass("has-cta"), Cookies.set("gvctafirst", !0)),
      this
    );
  },
});
!(function(t) {
  var e = function() {
    return (
      (this.sizes = {
        xxs_max: 320,
        xs_min: 480,
        xs_mid: 568,
        sm_min: 768,
        sm_mid: 875,
        md_min: 992,
        md_mid: 1024,
        lg_min: 1200,
        xlg_min: 1300,
      }),
      (this.sizes.xs = this.sizes.xs_min),
      (this.sizes.sm = this.sizes.sm_min),
      (this.sizes.md = this.sizes.md_min),
      (this.sizes.lg = this.sizes.lg_min),
      this
    );
  };
  (e.prototype = {
    match: function(t) {
      var e = this.doc,
        i = (this.state = {});
      return (
        _.each(this.sizes, function(t, n) {
          i[n] = e >= t;
        }),
        (i.doc = e),
        i
      );
    },
    is: function(t) {
      var e = this.match(),
        i = !0;
      return _.isArray(t)
        ? (_.each(t, function(t, e) {
            i = i && e;
          }),
          i)
        : !!_.isString(t) && e[t];
    },
    isAtLeast: function(t) {
      return this.doc >= this.sizes[t];
    },
    init: function() {
      var e = this;
      return (
        (this.doc = t(document).width()),
        t(window).resize(
          _.debounce(function() {
            e.doc = t(document).width();
          }, 250)
        ),
        this
      );
    },
  }),
    GV.module("mq", new e()),
    GV.init();
})(window.jQuery),
  (function(t, e, i) {
    t("#ct-main-nav").on("click", ".ct-nav-toggle", function() {
      var e = t("#ct-main-footer").offset().top + t("#ct-main-nav").height();
      t("html,body").animate({ scrollTop: e }, 250);
    });
  })(window.jQuery, GV, GV.module("nav")),
  (function(t, e, i) {
    function n(t, e) {
      var i,
        n,
        o = t.indexOf("?") < 0 ? "" : t.substr(t.indexOf("?") + 1),
        s = t.indexOf("?") < 0 ? t : t.substr(0, t.indexOf("?"));
      return (
        o.length > 0 &&
          ((i = o.split("&")),
          (n = {}),
          _.forEach(i, function(t) {
            var e = t.split("=");
            n[e[0]] = e[1];
          }),
          (e = _.extend(n, e))),
        (i = []),
        _.forEach(e, function(t, e) {
          i.push(e + "=" + t);
        }),
        s + "?" + i.join("&")
      );
    }
    var o = ".ct-modal-ctrl",
      s = (i.specs = {
        "#ct-search": function(e, i, n) {
          switch (n) {
            case "modal-open":
              t(i)
                .find(".search-input")
                .first()
                .focus();
          }
          return !1;
        },
      });
    i.players = {};
    t(o).length > 0 &&
      t(".ct-body-wrapper").on("click", o, function() {
        var i,
          o,
          r,
          a = t(this);
        if (a.is("a")) i = a.attr("href").split("|");
        else {
          if (!a.attr("data-href")) return !1;
          i = a.attr("data-href").split("|");
        }
        switch (((o = i[0]), (r = i[1]))) {
          case "modal-close":
            if (t(o + "_player").length > 0) {
              var c = t(o + "_player");
              c.attr("src", c.attr("src").replace("autoplay=1", "autoplay=0"));
            }
            t(o).fadeOut(250, function() {
              e.$window.trigger("gv:modal-close", [o, r, a]),
                _.isFunction(s[o]) && s[o](a, o, r);
            }),
              t("body").removeClass("modal-active");
            break;
          case "modal-open-autoplay":
            t(window)
              .one("gv:autoplayer:play", function() {
                var e = t(o + "_player");
                e.attr("src").indexOf("autoplay") < 0 &&
                  e.attr("src", n(e.attr("src"), { autoplay: "0" })),
                  e.attr(
                    "src",
                    e.attr("src").replace("autoplay=0", "autoplay=1")
                  );
              })
              .one("gv:autoplayer:stop", function() {
                c.attr(
                  "src",
                  c.attr("src").replace("autoplay=1", "autoplay=0")
                );
              });
          case "modal-open":
            t(o).fadeIn(250, function() {
              e.$window.trigger("gv:modal-open", [o, r, a]),
                _.isFunction(s[o]) && s[o](a, o, r),
                "modal-open-autoplay" == r &&
                  t(window).trigger("gv:autoplayer:play");
            }),
              t("body").addClass("modal-active");
        }
        return !1;
      });
  })(window.jQuery, window.GV, window.GV.module("modal")),
  (function(t, e, i) {
    var n = window.gvlocals.popupcookies;
    _.each(n, function(t) {
      var e = {};
      _.isUndefined(Cookies.get(t.name)) &&
        (t.expires > 0 && (e.expires = t.expires),
        Cookies.set(t.name, Date.now(), e));
    });
  })(window.jQuery, window.GV, window.GV.module("popup")),
  (function(t, e, i) {
    var n = ".ct-anchor-ctrl";
    t(n).length > 0 &&
      t(".ct-body-wrapper").on("click", n, function() {
        var e,
          i,
          n,
          o,
          s = t(this);
        if ((console.log("click"), s.is("a"))) e = s.attr("href").split("|");
        else {
          if (!s.attr("data-href")) return !1;
          e = s.attr("data-href").split("|");
        }
        if (
          ((i = e[0]),
          (n = e[1]),
          (o = t(".ct-anchor-pt[name=" + i.replace("#") + "]").first()),
          !(o.length <= 0 && t(i).length > 0))
        )
          return !1;
        switch (((o = t(i).first()), n)) {
          case "scroll-to":
            t("body")
              .stop()
              .animate({ scrollTop: o.offset().top - 20, duration: 300 });
            break;
          case "jump-to":
            t("body").scrollTop(o.first().offset().top - 20);
        }
        return !1;
      });
  })(window.jQuery, window.GV, window.GV.module("anchorscroll")),
  (function(t, e, i) {
    var n = [
      ".ct-post h1",
      ".ct-post h2",
      ".ct-post h3",
      ".ct-post .h1",
      ".ct-post .h2",
      ".ct-post .h3",
      ".stack-row h1",
      ".stack-row h2",
      ".stack-row h3",
      ".stack-row .h1",
      ".stack-row .h2",
      ".stack-row .h3",
      ".ct-articleunit-content h1",
      ".ct-articleunit-content h2",
      ".ct-articleunit-content h3",
      ".ct-articleunit-content .h1",
      ".ct-articleunit-content .h2",
      ".ct-articleunit-content .h3",
    ];
    (i.routine = function() {
      t(n.join(",")).each(function() {
        var e, i, n;
        for (i = t(this), n = i; n.length; ) (i = n), (n = n.children());
        (e = i.text().replace(/\S{12,}/g, function(t) {
          return "<span class='force-smaller'>" + t + "</span>";
        })),
          i.html(e);
      });
    }),
      i.routine();
  })(window.jQuery, window.GV, window.GV.module("typefixes")),
  (function(t, e, i) {
    var n = [],
      o = e.module("mq");
    (i = function(e) {
      (this.MAX_SHIFT =
        2 *
        t(".ct-nav-wrapper")
          .first()
          .height()),
        (this.bb = e),
        this.initEvents();
    }),
      (i.prototype = {
        initEvents: function() {
          function e(e) {
            var n = t("body").scrollTop(),
              s = i.bb.hasClass("ct-post-feature");
            o.isAtLeast("md") &&
              n <= i.MAX_SHIFT &&
              (n > i.MAX_SHIFT && (n = i.MAX_SHIFT),
              i.bb.css({
                marginTop: -1 * n + "px",
                marginBottom: s ? 0 : n / -2 + "px",
              }),
              i.bb
                .find(".ct-billboard-poster")
                .css({ opacity: 1 - n / (5 * i.MAX_SHIFT) }));
          }
          var i = this;
          t(window)
            .on("scroll", e)
            .on("resize", function() {
              i.bb.removeAttr("style");
            }),
            i.bb.css({ marginTop: 0, marginBottom: 0, opacity: 1 }),
            t("body").scrollTop() >= i.MAX_SHIFT &&
              (i.bb.css({
                marginTop: -1 * i.MAX_SHIFT + "px",
                marginBottom: i.MAX_SHIFT / -2 + "px",
              }),
              i.bb
                .find(".ct-billboard-poster")
                .css({ opacity: 1 - i.MAX_SHIFT / (5 * i.MAX_SHIFT) }));
        },
      }),
      t(".ct-billboard-wrapper").length > 0 &&
        t(".ct-billboard-wrapper").each(function() {
          n.push(new i(t(this)));
        });
  })(window.jQuery, GV, GV.module("billboard")),
  fbInit(),
  (function(t, e, i) {
    function n() {
      _pushReply.setSegment(
        "merchantId",
        "50c309cf-c831-4472-9cc2-5c39a77adea3"
      ),
        _pushReply.setSegment("calendarCode", "test-notifications");
    }
    (i.shareRoutine = function(e) {
      var i = e.attr("data-platform"),
        n = e.attr("data-permalink"),
        o = e.attr("data-picture") || !1,
        s =
          e
            .parents(".post, .ct-post-container")
            .find(".ct-ctrl-title")
            .first()
            .text()
            .trim() || e.attr("data-title");
      if (t("#beta-website-on").length > 0)
        return alert("Sharing has been disabled for the beta!"), !1;
      if ("twitterQuote" === i) {
        var r = '"' + e.attr("data-quote").trim() + '"',
          a = "via @garyvee",
          c = r.length + a.length + n.length + 2;
        r =
          c > 140
            ? "text=" + encodeURIComponent(r) + "&url=" + encodeURIComponent(n)
            : "text=" + encodeURIComponent(r + " " + n + " " + a) + "&url=";
      }
      switch (
        (console.log("SHARE ROUTINE", i, n),
        _.isUndefined(n) && (n = window.current_share_perma),
        (_.isUndefined(s) || "" === s) && (s = window.current_share_title),
        i)
      ) {
        case "facebook":
          window.open(
            "https://facebook.com/dialog/feed?display=popup&app_id=" +
              window.FB_APP_ID +
              "&link=" +
              encodeURIComponent(n) +
              (o ? "&picture=" + encodeURIComponent(o) : ""),
            "_blank",
            "height=275,width=450,top=0,left=0"
          );
          break;
        case "twitter":
          window.open(
            "https://twitter.com/intent/tweet?text=" +
              encodeURIComponent(s) +
              "&url=" +
              encodeURIComponent(n) +
              "&via=garyvee",
            "_blank",
            "height=275,width=450,top=0,left=0"
          );
          break;
        case "twitterQuote":
          window.open(
            "https://twitter.com/intent/tweet?" + r,
            "_blank",
            "height=275,width=450,top=0,left=0"
          );
          break;
        case "linkedin":
          window.open(
            "https://www.linkedin.com/shareArticle?title=" +
              encodeURIComponent(s) +
              "&url=" +
              encodeURIComponent(n) +
              "&mini=true&source=GaryVaynerchuk.com",
            "_blank",
            "height=500,width=500,top=0,left=0"
          );
          break;
        case "pinterest":
          window.open(
            "http://pinterest.com/pin/create/button/?url=" +
              encodeURIComponent(n) +
              "&is_video=false&description=" +
              encodeURIComponent(s) +
              "&media=" +
              encodeURIComponent(e.attr("data-media")),
            "_blank",
            "height=500,width=500,top=0,left=0"
          );
          break;
        case "googleplus":
          window.open(
            "https://plus.google.com/share?url=" + encodeURIComponent(n),
            "_blank",
            "height=500,width=500,top=0,left=0"
          );
          break;
        case "reddit":
          window.open(
            "http://www.reddit.com/submit?url=" +
              encodeURIComponent(n) +
              "&title=" +
              encodeURIComponent(s),
            "_blank",
            "height=500,width=500,top=0,left=0"
          );
          break;
        case "stumble":
          window.open(
            "http://www.stumbleupon.com/submit?url=" +
              encodeURIComponent(n) +
              "&title=" +
              encodeURIComponent(s),
            "_blank",
            "height=500,width=500,top=0,left=0"
          );
          break;
        case "email":
          window.open(
            "mailto:?subject=" +
              encodeURIComponent(s) +
              "&body=" +
              encodeURIComponent(n),
            "_blank"
          );
      }
      return !1;
    }),
      t(".ct-body-wrapper, .ct-single-wrapper").on(
        "click",
        ".ct-ctrl-share",
        function() {
          return (
            _.isUndefined(FB)
              ? fbInit(function() {
                  i.shareRoutine(t(this));
                })
              : i.shareRoutine(t(this)),
            !1
          );
        }
      ),
      t(".ct-body-wrapper").on("click", ".ct-btn-tweet", function() {
        return (
          window.open(
            "https://twitter.com/intent/tweet?text=" +
              encodeURIComponent(".@garyvee ") +
              "&url=",
            "_blank",
            "height=275,width=450,top=0,left=0"
          ),
          !1
        );
      }),
      t(".ct-body-wrapper").on("click", ".ct-post-mobileshare", function() {
        var e = t(this).attr("data-permalink"),
          i = t(this)
            .parents(".post, .ct-post-container")
            .find(".ct-ctrl-title")
            .first()
            .text()
            .trim();
        return (
          t("body").addClass("modal-active"),
          (window.current_share_perma = e),
          (window.current_share_title = i),
          console.log("PERMA", window.current_share_perma, e),
          t("#ct-mobile-share")
            .stop()
            .fadeIn(250, function() {}),
          !1
        );
      }),
      t("#cal-reply-subscribe").click(function(t) {
        var e = window._pushReply || [];
        return (
          e.isSupportedBrowser() &&
            (console.log(">> CalReply sub click?", e),
            t.preventDefault(),
            n(),
            e.register()),
          !1
        );
      }),
      window._pushReply.push({ webServiceUrl: "https://pushapi.calreply.net" }),
      t(".gform_wrapper input[type=submit]").on("click", function() {
        var e = t(".gform_wrapper").height();
        t(document).on("gform_confirmation_loaded", function() {
          t(".gforms_confirmation_message").height(e / 2),
            t("html, body").animate(
              { scrollTop: t("#page-contact-form").offset().top - 100 },
              500
            );
        });
      });
  })(window.jQuery, GV, GV.module("social")),
  (function(t, e, i) {
    function n(e) {
      var i, n, s, r;
      t(".ct-post-sharing.sidebar").length > 0 &&
        ((i = t(".ct-post-sharing.sidebar.init")),
        (n = t("body").scrollTop() || t("html").scrollTop()),
        (r = parseInt(i.attr("data-top"))),
        (s = r - n),
        s > r + t(window).height() / 2 && (s = r + t(window).height() / 2),
        n > o - 800 ? i.addClass("tuck") : i.removeClass("tuck"),
        (n < 2 * i.height() || "resize" === e.type) && i.css({ marginTop: s }));
    }
    var o, s;
    (s = function() {
      var i,
        n,
        s,
        r,
        a = t(".ct-single-wrapper .container").first();
      a.length > 0 &&
        ((i = a.offset().top),
        (n = a.offset().left),
        t(".ct-post-sharing.sidebar").length > 0 &&
          e.module("mq").isAtLeast("md_mid") &&
          ((o = t(".ct-post-footer").offset().top),
          (r = t("article.post")
            .find(".ct-post-sharing.sidebar")
            .first()),
          (s =
            i +
            a
              .find("h1.ct-ctrl-title")
              .first()
              .height() +
            50),
          r.attr("data-top", s),
          r.addClass("init").css({
            marginTop: s,
            left: n - r.width() - parseInt(r.css("padding-right")),
          })));
    }),
      t(window)
        .on("scroll", _.throttle(n, 0))
        .on("resize", function(t) {
          s(t), n(t);
        }),
      t("body.single-post").length > 0 &&
        (t("#fb-comments-trigger").click(function() {
          var e = t("#fb-comments-display"),
            i = t(this);
          return (
            i.hasClass("ct-btn-grey")
              ? (i
                  .removeClass("ct-btn-grey")
                  .addClass("ct-btn-red")
                  .text("Hide Comments"),
                e.stop().slideDown(250))
              : i.hasClass("ct-btn-red") &&
                (i
                  .removeClass("ct-btn-red")
                  .addClass("ct-btn-grey")
                  .text("Show Comments"),
                e.stop().slideUp(250)),
            t("body")
              .delay(250)
              .stop()
              .animate({ scrollTop: i.offset().top - 50 }),
            !1
          );
        }),
        s()),
      t(".wp-caption").length > 0 && t(".wp-caption").removeAttr("style");
  })(window.jQuery, GV, GV.module("blog")),
  (function(t, e, i) {
    var n = [];
    (i = function(t) {
      (this.pclass = ".ct-wiki-expandable"),
        (this.conclass = ".ct-wiki-content"),
        (this.wiki_block = t),
        this.initEvents();
    }),
      (i.prototype = {
        initEvents: function() {
          var e = this,
            i = e.wiki_block;
          i.on("click", ".ct-wiki-expand-ctrl", function() {
            var i = (t(this).attr("href"), t(this)),
              n = i.parents(e.pclass);
            return (
              n.find(e.conclass).slideToggle(250, function() {
                n.toggleClass("opened"),
                  n.hasClass("opened") &&
                    t("body")
                      .stop()
                      .animate({ scrollTop: i.offset().top });
              }),
              !1
            );
          });
        },
      }),
      t(".ct-wiki-expandable").length > 0 &&
        t(".ct-wiki-expandable").each(function() {
          n.push(new i(t(this)));
        });
  })(window.jQuery, window.GV, window.GV.module("wikirows")),
  (function(t, e, i) {
    var n = [],
      o = ".ct-widget-mailinglist",
      s = window.gvlocals.app_base + "wp-admin/admin-ajax.php",
      r = "Valid email required.",
      a = "Name required.",
      c = "Something went wrong. Try again in a few minutes.",
      l = "You're already subscribed, my friend. ;)",
      d = "Sent you confirmation email. Welcome to the hustle!";
    (i = function(t, e) {
      (this.$widget = t),
        (this.$mc = t.find("form").first()),
        (this.form_type = this.$mc.attr("name")),
        (this.index = e),
        this.initEvents();
    }),
      (i.prototype = {
        checkUser: function(e, i) {
          var n = this;
          t.post(s, _.extend({ action: "load_gvmc_checkuser" }, e), function(
            t,
            i
          ) {
            var o = JSON.parse(t);
            o.error
              ? 404 === o.error.code
                ? n.subscribeUser(e)
                : n.formAlert("mc_error", c)
              : n.formAlert("duplicate", l);
          });
        },
        dismissAlert: function() {
          this.$widget
            .find(".ct-widget-alert")
            .stop()
            .slideUp(100, function() {
              t(this)
                .find(".message")
                .text(""),
                t(this).removeClass("success error");
            });
        },
        formAlert: function(t, e) {
          var i = "success",
            n = this.$widget.find(".ct-widget-alert").first();
          switch (t) {
            case "valid_error":
            case "mc_error":
              i = "error";
              break;
            case "duplicate":
            case "success":
              i = "success";
          }
          n.find(".message").text(e),
            n
              .addClass(i)
              .stop()
              .slideDown(250);
        },
        getFormData: function() {
          return this.$widget
            .find("form")
            .first()
            .serializeObject();
        },
        initEvents: function() {
          var e = this.$mc,
            i = this;
          e
            .on("submit", function(t) {
              return t.preventDefault(), !1;
            })
            .on("click", ".gvmc-ctrl-subscribe", function(e) {
              var n,
                o = t(this);
              if ((e.preventDefault(), "subscribe" === o.attr("name"))) {
                if (
                  ((n = i.getFormData()),
                  i.dismissAlert(),
                  is.not.email(n.email))
                )
                  return i.formAlert("valid_error", r);
                if (n.fname.length <= 0) return i.formAlert("valid_error", a);
                i.checkUser(n);
              }
              return !1;
            }),
            i.$widget.on("click", ".ct-widget-ctrl.close", function(t) {
              return t.preventDefault(), i.dismissAlert(), !1;
            });
        },
        subscribeUser: function(e, i) {
          var n = this;
          t.post(s, _.extend({ action: "load_gvmc_sub" }, e), function(t, e) {
            var i = JSON.parse(t);
            console.log("subscribeUser", i),
              _.isObject(i.response) &&
                ("Member Exists" === i.response.title
                  ? n.formAlert("duplicate", l)
                  : n.formAlert("success", d));
          });
        },
      }),
      t(o).length > 0 &&
        t(o).each(function(e, o) {
          t(this).hasClass("gvmc-ctrl-nojs") || n.push(new i(t(this), o));
        });
  })(window.jQuery, window.GV, window.GV.module("mailchimp")),
  (function(t, e, i, n) {
    var o = [],
      s = window.location;
    (i = function(t) {
      (this.$block = t),
        this.initEvents(),
        (this.img_src = this.$block
          .find("img")
          .first()
          .attr("src")),
        (this.article = s.origin + s.pathname + "?shareimg=");
    }),
      (i.prototype = {
        initEvents: function() {
          var e,
            i = this.$block,
            o = this;
          (e = '<div class="ct-caption-sharing">'),
            (e +=
              '<a href="#facebook" data-platform="facebook" class="ct-btn ct-btn-s-fb"><span class="lift"><i class="fa fa-facebook"></i></span></a>'),
            (e += "</div>"),
            i.find(".wp-caption-text").append(e),
            i.on("click", ".ct-caption-sharing .ct-btn", function() {
              var e = t(this);
              e.attr("data-permalink", s),
                e.attr("data-picture", o.img_src),
                n.shareRoutine(e);
            });
        },
      }),
      t(".ct-post-content .wp-caption").length > 0 &&
        t(".ct-post-content .wp-caption").each(function() {
          o.push(new i(t(this)));
        });
  })(
    window.jQuery,
    window.GV,
    window.GV.module("imgsharing"),
    window.GV.module("social")
  );

