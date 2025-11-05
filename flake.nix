{
  description = "indycave.xyz";

  inputs      = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
       kite.url = "github:indynet/kite";
  };

  outputs     = { self, nixpkgs, kite, ... }:
    let
      copyright = "2025";
      system    = "x86_64-linux";
      pkgs      = import nixpkgs { inherit system; };
    in
      with pkgs.lib;
      with kite;
    {
      packages.${system}.default =
        let
          current = bind ask
              (r: if r.path == "/"
                  then tell ("indycave.xyz")
                  else tell ("indycave.xyz${strings.removeSuffix "/" r.path}"));

          headerC = header {} (h1 {} current);

          headC   = head {}
            (eff [
              (link { crossorigin = "anonymous"; rel = "preload"; type = "font/woff"; href = "/static/fonts/ibm_conv.woff"; as = "font"; })
              (link { crossorigin = "anonymous"; rel = "preload"; type = "font/woff"; href = "/static/fonts/mbyte.woff"; as = "font"; })
              (link { crossorigin = "anonymous"; rel = "preload"; type = "font/woff"; href = "/static/fonts/tandy.woff"; as = "font"; })
              (link { defer = "true";  rel = "shortcut icon"; type = "image/x-icon"; href = "/static/favicon.ico"; })
              (link { defer = "true";  rel = "stylesheet";    type = "text/css";     href = "/static/styles.css";  })
              (meta { content = "width=device-width, initial-scale=1"; name = "viewport"; })
              (meta { name = "keywords"; content = "Haskell, Neocities, Small, Silly"; })
              (meta { name = "description"; content = "silly website"; })
              (meta { name = "author"; content = "indiegirls"; })
              (meta { charset = "UTF-8"; })
              (title {} current)
            ]);

          boxesC  = m: td { id = "middle-td"; } (eff m);

          linksC  = td { id = "right-td"; }
            (boxC (eff
              [
                (h2 { id = "side-links"; } (tell "Links"))
                (ul { class = "links"; }
                  (eff
                    [
                      (li {} (a { href = "/";     } (tell "Home")))
                      (li {} (a { href = "/indy"; } (tell "Indy")))
                    ]))
              ]));

          mainC   = child: html { lang = "en"; }
            (eff [
              headC
              (body {}
                (eff
                  [
                    headerC
                    (div { id = "content"; } (table {} (tbody {} (tr {} (and child linksC)))))
                    (footer { id = "c"; } (tell "(c) ${copyright} All Rights Reserved"))
                  ]))
            ]);

          boxC    = div { class = "box"; };

          indy    = doc
            (mainC
              (boxesC [
                (boxC
                  (eff [
                    (h2 {} (tell "Me"))
                    (p {}
                      (eff [
                        (tell "My name is indy, I'm ")
                        (b {} (tell "17"))
                        (tell " years old, and I'm a self-taught programmer of eight years.")
                      ]))

                    (p {} (tell "I spend my time, pretty much every day, making things. I'm quite creative, and I take pride in my ability to create."))
                    (p {} (tell "I really do love the haskell programming language, it's pretty much my favorite thing ever. Except maybe agda."))
                    (p {} (tell "I like hearing people yap, and I love making friends! My contacts are generally open, if you'd like to have a chat."))
                  ]))

                (boxC
                  (eff [
                    (h2 {} (tell "Pronouns"))
                    (p {} (tell "These are the pronouns that I identify myself with."))
                    (ul {}
                      (eff [
                        (li {} (tell "she/her"))
                        (li {} (tell "they/them"))
                      ]))
                  ]))

                (boxC
                  (eff [
                    (h2 {} (tell "Names"))
                    (p {} (tell "These are valid identifiers that refer to myself."))
                    (ul {}
                      (eff [
                        (li {} (tell "indy"))
                        (li {} (tell "indynet"))
                        (li {} (tell "indiegirls"))
                      ]))
                  ]))
              ]));

          index   = doc
            (mainC
              (boxesC [
                (boxC
                  (eff [
                    (h2 {} (and (tell "Welcome") (span { class = "pastel tl"; } (tell "★"))))
                    (p {}
                      (eff [
                        (a { href = "/"; class = "specil"; } (tell "Indycave"))
                        (tell " contains contact and general information for either buisness or social connection. Please refer to the ")
                        (a { href = "#Contact"; class = "specil"; } (tell "Contact"))
                        (tell " section for such information")
                      ]))
                    (p {}
                      (eff [
                        (tell "Welcome to my space! I created this website back in ")
                        (b {} (tell "2020"))
                        (tell ", just as a place to put all the stuff about me that people might need to know. I made this place myself, it's actually been through quite a variety of designs both on the front and the back end.")
                      ]))
                    (p {} (tell "I like having my own personal space, I feel like the current internet lacks the personality that things like this can bring. I'll be updating this website often to try and make it more interesting and fun, as well as adding some more useful stuff. So, I suppose you may look forward to that!"))
                  ]))

                (boxC
                  (eff [
                    (img { alt = "OneShotNiko"; height = "65"; width = "65"; src = "/static/indynet.png"; class = "indyping"; })
                    (p {} (tell "My name is Indy. I'm a silly human on the internet. I make cool stuff, sometimes."))
                    (p {} (tell "Where are some facts you may want to know,"))
                    (ul { class = "cl"; }
                      (eff [
                        (li {}
                          (eff [
                            (tell "favorite programming language is the ")
                            (b {} (tell "Haskell"))
                            (tell " programming language")
                          ]))
                        (li {} (tell "recreational programmer"))
                        (li {} (tell "cat enjoyer"))
                      ]))
                    (p {}
                      (eff [
                        (tell "If you'd like to know more about me, I have a ")
                        (a { href = "/indy"; } (b {} (tell "page")))
                        (tell " containing a lot more information.")
                      ]))
                  ]))

                (boxC
                  (eff [
                    (h2 {} (tell "Thingies"))
                    (p {} (tell "I don't make many of my projects public, but here are some that you might be interested in."))
                    (ul {}
                      (eff [
                        (li {} (a { href = "https://github.com/indynet/wordbankhttps://github.com/indynet/wordbankhttps://github.com/indynet/wordbank"; } (tell "small wordbank library")))
                        (li {} (a { href = "https://github.com/indynet/nix"; } (tell "my nix config")))
                        (li {} (a { href = "https://github.com/indynet/web"; } (tell "this website")))
                        (li {} (a { href = "https://github.com/indynet/kite"; } (tell "kite")))
                      ]))
                  ]))

                (boxC
                  (eff [
                    (h2 {} (tell "Contact"))
                    (p {}
                      (eff [
                        (tell "The fastest way to contact me is through discord, in which my user is ")
                        (b {} (tell "indiegirls"))
                        (br {})
                        (ul { class = "cl"; }
                          (eff [
                            (li {}
                              (eff [
                                (a { href = "mailto:indynet00@gmail.com"; } (tell "Email"))
                                (b {} (tell "("))
                                (tell "for buisness inquiry")
                                (b {} (tell ")"))
                              ]))
                            (li {} (a { href = "https://github.com/indynet"; } (tell "Github")))
                            (li {} (a { href = "https://bsky.app/profile/indynet.bsky.social"; } (tell "Bsky")))
                          ]))
                      ]))
                  ]))
              ]));
        in kite.mk {
          name       = "indycave.xyz";
          page       = write index;
          src        = self;

          static     = [
            { copy = ./public/indynet.png; name = "indynet.png"; }
            { copy = ./public/favicon.ico; name = "favicon.ico"; }
            { copy = ./public/styles.css;  name = "styles.css";  }
            { copy = ./public/fonts;       name = "fonts";       }
          ];

          pages.indy = {
            page = write indy;
          };
        };
    };
}
