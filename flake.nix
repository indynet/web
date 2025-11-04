{
  description = "indycave.xyz";

  inputs      = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    sweb.url    = "github:indynet/sweb";
  };

  outputs     = { self, nixpkgs, sweb, ... }:
    let
      copyright = "2025";
      system    = "x86_64-linux";
      pkgs      = import nixpkgs { inherit system; };
    in
      with sweb.libswb;
      with sweb.reader;
      {
        packages.${system}.default = let
          headerC = header {} [ (h1 {} [ (pure "indycave.xyz") ]) ];
          headC   = head {} [
            (link { defer = "true"; rel = "shortcut icon"; type = "image/x-icon"; href = "/static/favicon.ico"; } [])
            (link { defer = "true"; href = "/static/styles.css"; rel = "stylesheet"; type = "text/css"; } [])           
            (meta { content = "width=device-width, initial-scale=1"; name = "viewport"; } [])
            (link { rel = "preload"; href = "/static/fonts/ibm_conf.woff"; as = "font"; } [])
            (link { rel = "preload"; href = "/static/fonts/mbyte.woff"; as = "font"; } [])
            (link { rel = "preload"; href = "/static/fonts/tandy.woff"; as = "font"; } [])
            (title {} [ (pure "indycave.xyz") ])
          ];

          wasmC   = script {
              defer = "true";
              type  = "module";
              src   = "/static/index.js";
          } [];

          boxesC  = td { id = "middle-td"; };

          linksC  = td { id = "right-td"; } [
            (div { class = "box"; }
              [ (h2 { id = "side-links"; } [ (pure "Links") ])
                (ul { class = "links"; }
                  [
                    (li {} [ (a { href = "/"; } [ (pure "Home") ]) ])
                  ])
              ])
          ];

          mainC   = child: html { lang = "en"; } [
            headC
            (body {}
              [ wasmC
                headerC
                (div { id = "content"; }
                  [
                    (table {} [
                      (tbody {} [
                        (tr {} child)
                      ])
                    ])
                  ])
                (footer { id = "c"; }
                  [
                    (pure "(c) ${copyright} All Rights Reserved")
                  ])
              ])
          ];
        in sweb.mkSweb {
            name  = "indycave";
            src   = self;

            index = {
              static = [
                ./public/indynet.png
                ./public/favicon.ico
                ./public/styles.css
                ./public/index.js
                ./public/fonts
              ];

              html   = doc (mainC
                [
                  (boxesC
                    [
                      (div { class = "box"; }
                        [
                          (h2 {}
                            [ (pure "Welcome")
                              (span { class = "pastel tl"; } [ (pure "★") ])
                            ])

                          (p {}
                            [
                              (a { href = "/"; class = "specil"; } [ (pure "Indycave") ])
                              (pure " contains contact and general information for either buisness or social connection. Please refer to the ")
                              (a { href="#Contact"; class = "specil"; } [ (pure "Contact") ])
                              (pure " section for such information")
                            ])

                          (p {}
                            [
                              (pure "Welcome to my space! I created this website back in ")
                              (b {} [ (pure "2020") ])
                              (pure ", just as a place to put all the stuff about me that people might need to know. I made this place myself, it's actually been through quite a variety of designs both on the front and the back end.")
                            ])

                          (p {}
                            [
                              (pure "I like having my own personal space, I feel like the current internet lacks the personality that things like this can bring. I'll be updating this website often to try and make it more interesting and fun, as well as adding some more useful stuff. So, I suppose you may look forward to that!")
                            ])
                        ])

                      (div { class = "box"; }
                        [
                          (img { height = "65"; width = "65"; src = "/static/indynet.png"; class = "indyping"; } [])
                          (p {} [ (pure "My name is Indy. I'm a silly human on the internet. I make cool stuff, sometimes.") ])
                          (p {} [ (pure "Here are some facts you may want to know,") ])
                          (ul { class = "cl"; }
                            [
                              (li {}
                                [
                                  (pure "favorite programming language is the ")
                                  (b {} [ (pure "Haskell") ])
                                  (pure " programming language")
                                ])

                              (li {}
                                [
                                  (pure "recreational programmer")
                                ])

                              (li {}
                                [
                                  (pure "cat enjoyer")
                                ])
                            ])
                          (p {}
                            [
                              (pure "If you'd like to know more about me, I have a ")
                              (a { href = "/indy"; } [ (b {} [ (pure "page") ]) ])
                              (pure " containing a lot more information.")
                            ])
                        ])

                      (div { class = "box"; }
                        [
                          (h2 {} [ (pure "Thingies") ])
                          (p {}
                            [
                              (pure "I don't make many of my projects public, but here are some small ones that you might be interested in.")
                            ])
                          (ul {}
                            [
                              (li {}
                                [
                                  (a { href = "https://github.com/indynet/wordbankhttps://github.com/indynet/wordbankhttps://github.com/indynet/wordbank"; } [ (pure "small wordbank library") ])
                                ])

                              (li {}
                                [
                                  (a { href = "https://github.com/indynet/nix"; } [ (pure "my nix config") ])
                                ])

                              (li {}
                                [
                                  (a { href = "https://github.com/indynet/web"; } [ (pure "this website") ])
                                ])

                              (li {}
                                [
                                  (a { href = "https://github.com/indynet/sweb"; } [ (pure "sweb") ])
                                ])
                            ])
                        ])

                      (div { class = "box"; }
                        [
                          (h2 {} [ (pure "Contact") ])
                          (p {}
                            [
                              (pure "The fastest way to contact me is through discord, in which my user is ")
                              (b {} [ (pure "indiegirls") ])
                              (br {} [])
                              (ul { class = "cl"; }
                                [
                                  (li {}
                                    [
                                      (a { href = "mailto:indynet00@gmail.com"; } [ (pure "Email ") ])
                                      (b {} [ (pure "(") ])
                                      (pure "for buisness inquiry")
                                      (b {} [ (pure ")") ])
                                    ])

                                  (li {}
                                    [
                                      (a { href = "https://github.com/indynet"; } [ (pure "Github") ])
                                    ])

                                  (li {}
                                    [
                                      (a { href = "https://bsky.app/profile/indynet.bsky.social"; } [ (pure "Bsky") ])
                                    ])
                                ])
                            ])
                        ])
                    ])

                  linksC
                ]);

              main   = ./Main.hs;
            };
          };
      };
}
