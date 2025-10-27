{
  activesupport = {
    dependencies = ["base64" "bigdecimal" "concurrent-ruby" "connection_pool" "drb" "i18n" "json" "logger" "minitest" "securerandom" "tzinfo" "uri"];
    source = null;
    targets = [];
  };
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10yknjyn0728gjn6b5syynvrvrwm66bhssbxq8mkhshxghaiailm";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.3";
  };
  async = {
    dependencies = ["console" "fiber-annotation" "io-event" "metrics" "traces"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hg1fx60kfjfyj4qxrl6hqldhwnkz3wk1i5sqnv5ph3m8myj1av5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.34.0";
  };
  backport = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xbzzjrgah0f8ifgd449kak2vyf30micpz6x2g82aipfv7ypsb4i";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.0";
  };
  base64 = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yx9yn47a8lkfcjmigk79fykxvr80r4m1i35q82sxzynpbm7lcr7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.0";
  };
  benchmark = {
    source = null;
    targets = [];
  };
  bigdecimal = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0612spks81fvpv2zrrv3371lbs6mwd7w6g5zafglyk75ici1x87a";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.3.1";
  };
  concurrent-ruby = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ipbrgvf0pp6zxdk5ascp6i29aybz2bx9wdrlchjmpx6mhvkwfw1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.3.5";
  };
  connection_pool = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02p7l47gvchbvnbag6kb4x2hg8n28r25ybslyvrr2q214wir5qg9";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.5.4";
  };
  console = {
    dependencies = ["fiber-annotation" "fiber-local" "json"];
    source = null;
    targets = [];
  };
  csv = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gz7r2kazwwwyrwi95hbnhy54kwkfac5swh2gy5p5vw36fn38lbf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.3.5";
  };
  date = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kz6mc4b9m49iaans6cbx031j9y7ldghpi5fzsdh0n3ixwa8w9mz";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.4.1";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wmfy5n5v2rzpr5vz698sqfj1gl596bxrqw44sahq4x0rxjdn98l";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.11.0";
  };
  diff-lcs = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qlrj2qyysc9avzlr4zs1py3x684hqm61n4czrsk1pyllz5x5q4s";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.2";
  };
  drb = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wrkl7yiix268s2md1h6wh91311w95ikd8fy8m5gx589npyxc00b";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.2.3";
  };
  erb = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v7ll6sif577gbnd5c92cixr687jpvfig3lrmvxrw7am4iwnxhmj";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.1.1";
  };
  erubi = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1naaxsqkv5b3vklab5sbb9sdpszrjzlfsbqpy7ncbnw510xi10m0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.13.1";
  };
  ffi = {
    groups = ["default" "development"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "1si3p2yyzj1axrpq8503rsviaf192sgmad2r3b9czdyvr5ph5lh5";
      target = "x86_64-linux-gnu";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.17.2";
  };
  fiber-annotation = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00vcmynyvhny8n4p799rrhcx0m033hivy0s1gn30ix8rs7qsvgvs";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.2.0";
  };
  fiber-local = {
    dependencies = ["fiber-storage"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01lz929qf3xa90vra1ai1kh059kf2c8xarfy6xbv1f8g457zk1f8";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.0";
  };
  fiber-storage = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qa0j9qjwav9xb0n3isx0rbh0942xrfback392n6vs8bidnmp3pl";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.1";
  };
  fileutils = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nmmbvqxssmn9cav5x5sxcw9ab3vqpskdy3nbmsqfjk99f2iw9sp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.3";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03sx3ahz1v5kbqjwxj48msw3maplpp2iyzs22l4jrzrqh4zmgfnf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.14.7";
  };
  io-console = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jszj95hazqqpnrjjzr326nn1j32xmsc9xvd97mbcrrgdc54858y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.8.1";
  };
  io-event = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dll42xqa8y7hfpgf7yh72h1crs63x5jq9da251qp3pll57vwap5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.14.0";
  };
  irb = {
    dependencies = ["pp" "rdoc" "reline"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fpxa2m83rb7xlzs57daqwnzqjmz6j35xr7zb15s73975sak4br2";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.15.2";
  };
  jaro_winkler = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14xkw4lb6wwvbcwqkf6ds116sridk9c8yz6y3caw07vzpwdvcmn0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.1";
  };
  json = {
    source = null;
    targets = [];
  };
  kramdown = {
    dependencies = ["rexml"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "131nwypz8b4pq1hxs6gsz3k00i9b75y3cgpkq57vxknkv6mvdfw7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.5.1";
  };
  kramdown-parser-gfm = {
    dependencies = ["kramdown"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a8pb3v951f4x7h968rqfsa19c8arz21zw1vaj42jza22rap8fgv";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.0";
  };
  language_server-protocol = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k0311vah76kg5m6zr7wmkwyk5p2f9d9hyckjpn3xgr83ajkj7px";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.17.0.5";
  };
  lint_roller = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11yc0d84hsnlvx8cpk4cbj6a4dz9pk0r1k29p0n1fz9acddq831c";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.0";
  };
  listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rwwsmvq79qwzl6324yc53py02kbrcww35si720490z5w0j497nv";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.9.0";
  };
  logger = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00q2zznygpbls8asz5knjvvj2brr3ghmqxgr83xnrdj4rk3xwvhr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.0";
  };
  metrics = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wlh0g4xmfqa41dsh4m3514q3jcvy6jx97mwn6ayj62ir6xdbpk1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.15.0";
  };
  minitest = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c1c9lr7h0bnf48xj5sylg2cs2awrb0hfxwimiz4yfl6kz87m0gm";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.26.0";
  };
  minitest-focus = {
    dependencies = ["minitest"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v7z8xd5qgx3pb1047pml1si9y8awcm9yvxm5n94j1pynp94pw2c";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.4.0";
  };
  minitest-hooks = {
    dependencies = ["minitest"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11jb31dl5kbpyl3kgxql0p7da9066r2aqw54y5q6cni9nmld3zf5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.5.2";
  };
  minitest-proveit = {
    dependencies = ["minitest"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k1hpr8lgkgygfivgcsnnib7xjlf9ribgpn7yidvb4q0l0q2yfmr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.0";
  };
  minitest-rg = {
    dependencies = ["minitest"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vwgmk9dnvhlcwxi7j5z150sdqyy3fjs8r8wzx64ig3ivpnb188j";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.3.0";
  };
  mutex_m = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l875dw0lk7b2ywa54l0wjcggs94vb7gs8khfw9li75n2sn09jyg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.0";
  };
  netrc = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gzfmcywp1da8nzfqsql2zqi648mfnx6qwkig3cv36n9m0yy676y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.11.0";
  };
  nokogiri = {
    dependencies = ["racc"];
    groups = ["default" "development"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0whga1z91nridy04h1cklgbn2l12zmvhf87ap425rknvl9ms4nzz";
      target = "x86_64-linux-gnu";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.18.10";
  };
  observer = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b2h1642jy1xrgyakyzz6bkq43gwp8yvxrs8sww12rms65qi18yq";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.1.2";
  };
  ostruct = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nrir9wdpc4izqwqbysxyly8y7hsfr4fsv69rw91lfi9d5fv8lm";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.3";
  };
  pangea-sdk = {
    dependencies = ["connection_pool"];
    groups = ["default"];
    platforms = [];
    source = {
      path = ".";
      type = "path";
    };
    targets = [];
    version = "0.0.0";
  };
  parallel = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c719bfgcszqvk9z47w2p8j2wkz5y35k48ywwas5yxbbh3hm3haa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.27.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    source = null;
    targets = [];
  };
  pp = {
    dependencies = ["prettyprint"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xlxmg86k5kifci1xvlmgw56x88dmqf04zfzn7zcr4qb8ladal99";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.3";
  };
  prettier_print = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ybgks9862zmlx71zd4j20ky86fsrp6j6m0az4hzzb1zyaskha57";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.1";
  };
  prettyprint = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14zicq3plqi217w6xahv7b8f7aj5kpxv1j1w98344ix9h5ay3j9b";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.2.0";
  };
  prism = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sqwckzzpj1mmmjnqcvqmq6adlxbhkf5ij3b6ir4i33ih4d2ih5z";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.0";
  };
  psych = {
    dependencies = ["date" "stringio"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vii1xc7x81hicdbp7dlllhmbw5w3jy20shj696n0vfbbnm2hhw1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.2.6";
  };
  racc = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0byn0c9nkahsl93y9ln5bysq4j31q8xkf2ws42swighxd4lnjzsa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.8.1";
  };
  rainbow = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.1.1";
  };
  rake = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14s4jdcs1a4saam9qmzbsa2bsh85rj9zfxny5z315x3gg0nhkxcn";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "13.3.0";
  };
  rb-fsevent = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zmf31rnpm8553lqwibvv3kkx0v7majm1f341xbxc0bk5sbhp423";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.11.2";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vmy8xgahixcz6hzwy4zdcyn2y6d6ri8dqv5xccgzc1r292019x0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.11.1";
  };
  rbi = {
    dependencies = ["prism" "rbs"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12wd86asil3xxcpxcbvw56vypcr1bl3f94lwr5sqrwwpm60x51bx";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.7";
  };
  rbs = {
    dependencies = ["logger"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c0r26dhdr4jiklc0g7wjmr5q56dp7hwcfa8z75khkp8mrhazfpa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.9.5";
  };
  rdoc = {
    dependencies = ["erb" "psych" "tsort"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01cbwyx9rapyjdx847bhcb9iclmabdcajqs0rlm7rrv99636h3hg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "6.15.0";
  };
  redcarpet = {
    groups = ["development" "docs"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0iglapqs4av4za9yfaac0lna7s16fq2xn36wpk380m55d8792i6l";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.6.1";
  };
  regexp_parser = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "192mzi0wgwl024pwpbfa6c2a2xlvbh3mjd75a0sakdvkl60z64ya";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.11.3";
  };
  reline = {
    dependencies = ["io-console"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ii8l0q5zkang3lxqlsamzfz5ja7jc8ln905isfdawl802k2db8x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.2";
  };
  reverse_markdown = {
    dependencies = ["nokogiri"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "195c7yra7amggqj7rir0yr09r4v29c2hgkbkb21mj0jsfs3868mb";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.0.0";
  };
  rexml = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hninnbvqd2pn40h863lbrn9p11gvdxp928izkag5ysx8b1s5q0r";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.4.4";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "lint_roller" "parallel" "parser" "rainbow" "regexp_parser" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0d8n87wx2r8vkva5qi4m3hi4s9b6qhmzgw85qgv14hsa65prlaim";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.81.1";
  };
  rubocop-ast = {
    dependencies = ["parser" "prism"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bh1kls2cs2j3cmj6f2j2zmfqfknj2a6i441d828nh2mg00q49jr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.47.1";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "prism" "rbs"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "050qg73g4qs3xza441nafy7610daa3k4ra0pbi3sdlawy9fwfh6i";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.26.1";
  };
  ruby-progressbar = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.13.0";
  };
  securerandom = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cd0iriqfsf1z91qg271sm88xjnfd92b832z49p1nd542ka96lfc";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.4.1";
  };
  solargraph = {
    dependencies = ["backport" "benchmark" "diff-lcs" "jaro_winkler" "kramdown" "kramdown-parser-gfm" "logger" "observer" "ostruct" "parser" "prism" "rbs" "reverse_markdown" "rubocop" "thor" "tilt" "yard" "yard-activesupport-concern" "yard-solargraph"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k52l72bv513sgzpc88shh2xfcns3z7kv8m71r1n7fjajzna18w7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.57.0";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c5f88ph8gfwgr2hb900hxfhnrrmvzr0gnb61bnqfwz35r6qc32m";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.12649";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ybw81k4mv90lwxqgly6bvz3b3bf4s9clnic3vsri5k93x69l9pn";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.12649";
  };
  sorbet-static = {
    groups = ["default" "development"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "1zrbazp36fprp4n3vz0c3gcfgc6g5ifv7shyfsa6lg9nmyl6ggby";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "0.6.12649";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w2mq81r3b4zdjic0np18jr48swsiwz4sld3qjg4lcjnf8dfcww4";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.12649";
  };
  spoom = {
    dependencies = ["erubi" "prism" "rbi" "rexml" "sorbet-static-and-runtime" "thor"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lyi479sdk883azs21fd0lpfj054s3y86x9mfp5y78j3lq0sa18d";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.3";
  };
  steep = {
    dependencies = ["activesupport" "concurrent-ruby" "csv" "fileutils" "json" "language_server-protocol" "listen" "logger" "mutex_m" "parser" "rainbow" "rbs" "securerandom" "strscan" "terminal-table" "uri"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lfpyhac0bfviql8y9m0zmw10amwapp569747s6ipzxaz5amna8v";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.10.0";
  };
  stringio = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yh78pg6lm28c3k0pfd2ipskii1fsraq46m6zjs5yc9a4k5vfy2v";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.1.7";
  };
  strscan = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0isr7v4d9z145hkk9qip8fkcs6smi264lhd416bad5ckxa83nhgq";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.1.5";
  };
  syntax_tree = {
    dependencies = ["prettier_print"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ggi6p7xxjsj42q8pp0yz6z7dbwlbr6fjbs4qnafr667jab5mqjn";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "6.3.0";
  };
  syntax_tree-rbs = {
    dependencies = ["prettier_print" "rbs" "syntax_tree"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1g9n2i99y6b5l3x3vp2nk0fss2x0b2gd1h5hynbs2y4ab35jhrsr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.0";
  };
  tapioca = {
    dependencies = ["benchmark" "netrc" "parallel" "rbi" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xxi3rxvq40zpicsm9nmlijrpddcq9xza96dh24fy8i0bs53isxy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.16.11";
  };
  terminal-table = {
    dependencies = ["unicode-display_width"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lh18gwpksk25sbcjgh94vmfw2rz0lrq61n7lwp1n9gq0cr7j17m";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "4.0.0";
  };
  thor = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gcarlmpfbmqnjvwfz44gdjhcmm634di7plcx2zdgwdhrhifhqw7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.4.0";
  };
  tilt = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w27v04d7rnxjr3f65w1m7xyvr6ch6szjj2v5wv1wz6z5ax9pa9m";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.6.1";
  };
  traces = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05722prvh34n96irnxa762wz0yj2nyrz70ab2zby3b6snjf69wc0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.18.2";
  };
  tsort = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17q8h020dw73wjmql50lqw5ddsngg67jfw8ncjv476l5ys9sfl4n";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.2.0";
  };
  tzinfo = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16w2g84dzaf3z13gxyzlzbf748kylk5bdgg3n1ipvkvvqy685bwd";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.6";
  };
  unicode-display_width = {
    dependencies = ["unicode-emoji"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hiwhnqpq271xqari6mg996fgjps42sffm9cpk6ljn8sd2srdp8c";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.0";
  };
  unicode-emoji = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1995yfjbvjlwrslq48gzzc9j0blkdzlbda9h90pjbm0yvzax55s9";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "4.1.0";
  };
  uri = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jrl2vkdvc5aq8q3qvjmmrgjxfm784w8h7fal19qg7q7gh9msj1l";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.4";
  };
  webrick = {
    groups = ["development" "docs"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12d9n8hll67j737ym2zw4v23cn4vxyfkb6vyv1rzpwv6y6a3qbdl";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.9.1";
  };
  yard = {
    groups = ["development" "docs"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14k9lb9a60r9z2zcqg08by9iljrrgjxdkbd91gw17rkqkqwi1sd6";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.9.37";
  };
  yard-activesupport-concern = {
    dependencies = ["yard"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vwhhgkkrw57anbbsyv5aihmhhxpr255jqvhcy3jwgn2xyq0qydy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.0.1";
  };
  yard-solargraph = {
    dependencies = ["yard"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03lklm47k6k294ww97x6zpvlqlyjm5q8jidrixhil622r4cld6m1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.1.0";
  };
  yard-sorbet = {
    dependencies = ["sorbet-runtime" "yard"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08gy7xr94znrgsbd4f92hp8z9z097sm176lihsw8574y3d3aml83";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.9.0";
  };
}