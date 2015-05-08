h = require 'helpers'

exports.id = ->
    ids = [ 'id', 'counter', 'extractor', 'refubricator', 'a', 'b', 'c', 'x', 'y', 'coords', 'coordinates', 'remote', 'rem', 'todo', 'dunno', 'async', 'tree', 'depthFirst', 'error', 'user', 'name', 'userName', 'password', 'r', 'rx', 'lala', 'varvar', 'var2', 'var1', 'cnt', 'cnt2', 'usersx', 'viola','heureka', 'bob', 'kelly' ]

    generators = [
        -> h.random(ids) + h.capitalize(h.random(ids))
        -> h.random(ids) + "_" + h.random(ids)
        -> h.random(ids)
        -> h.random(ids) + h.RandomInt(5)]

    return h.random(generators)()

exports.string = ->
    strings = [ 'underscore','backbone4000','helpers','del','need child view constructor','need child view tag name','add','remove','add','remove','change','render','main','./ejs/main.ejs','logEntry','./ejs/logEntry.ejs','log','./ejs/log.ejs','tr','.collection','gameEntry','./ejs/gameEntry.ejs','lobby','./ejs/lobby.ejs','add','ADD','tr','.collection','header','./ejs/header.ejs','chat','./ejs/chat.ejs', 'validator2-extras','backbone4000','helpers','noty-browserify','users','games','user','createAddress','supportRequest','say','game','join','join result','hover','error','ready','hover','error','part','part result','hover','error','comm/clientside','game','backbone4000','raphael-browserify','underscore','validator2-extras','jquery-browserify','bomberman/views','bomberman/models','100%','90%','height','width','width','height','set','del','del','#003','#888','yellow','red','darkgreen','orange','blue','cyan','opacity','stroke-width','BorderWall','Empty','Bomb','Player','red','100%','100%','height','width','height','pic2/Stage.png','set','del','del','opacity','stroke-width','black','Bomb','BorderWall','IndestructibleWall','Wall','ExplosionOrigin','Explosion','Empty','Player','pic2/','.png','Player','pic2/','.png','#003','#888','yellow','red','darkgreen','orange','blue','cyan','opacity','stroke-width','u','d','r','l','b','#game','object','raw','001','registered','002','003','rpl_myinfo','rpl_isupport','CHANLIMIT',',',':','CHANMODES',',','a','b','c','d','CHANTYPES','CHANNELLEN','IDCHAN',',',':','KICKLEN','MAXLIST',',',':','NICKLEN','PREFIX','','','STATUSMSG','TARGMAX',',',':','TOPICLEN','rpl_luserclient','rpl_luserop','rpl_luserchannels','rpl_luserme','rpl_localusers','rpl_globalusers','rpl_statsconn','err_nicknameinuse','undefined','NICK','PING','PONG','ping','NOTI', 'notice','notice','GOT NOTICE from ','','','the server',': ','','MODE','MODE:',' sets mode: ','','+','-','+mode','','-mode','+mode','','-mode','NICK','NICK: ',' changes nick to ','string','nick','rpl_motdstart','\n','rpl_motd','\n','rpl_endofmotd','err_nomotd','\n','motd','rpl_namreply','','rpl_endofnames','names','names','MODE','rpl_topic','rpl_away','away','rpl_whoisuser','user','host','realname','rpl_whoisidle','idle','rpl_whoischannels','channels','rpl_whoisserver','server','serverinfo','rpl_whoisoperator','operator','330','account','accountinfo','rpl_endofwhois','whois','rpl_liststart','channellist_start','rpl_list','channellist_item','rpl_listend','channellist','333','topic','TOPIC','topic','rpl_channelmodeis','329','JOIN','','join','join','join','PART','part','part','part','KICK','kick','kick','kick','KILL','kill','PRIVMSG','privmsg','message','message#','message','message','pm','GOT MESSAGE from ',': ','INVITE','invite','QUIT','QUIT: ',' ',' ','string','quit','err_umodeunknownflag','ERROR: ','m','error','error','mERROR: ','0m','Unhandled message: ','msx','kick','JOIN',' ','motd','JOIN',' ','','function','function','registered','object','DEPTH_ZERO_SELF_SIGNED_CERT','UNABLE_TO_VERIFY_LEAF_SIGNATURE','CERT_HAS_EXPIRED','utf-8','CERT_HAS_EXPIRED','Connecting to server with expired certificate','PASS','Sending irc NICK/USER','NICK','USER','*','connect','utf8','connect','PASS','NICK','USER','*','connect','','data','\r\n','raw','end','Connection got end event','close','Connection got close event','Disconnected: reconnecting','Maximum retry count (',') reached. Aborting','abort','Waiting ','ms before retrying','error','netError','function','node-irc says goodbye','open','QUIT','function','end','',':','SEND: ',' ',' ','\r\n','join','function' ]

    generators = [
        { weight: 10, f: -> h.random strings }
        { weight: 1, f: -> String(h.RandomInt 100) }
    ]

    return h.weightedRandom(generators, (entry) -> entry.weight).f()
